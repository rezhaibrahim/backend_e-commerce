const cartModel = require('../models/cart')
const { cartSchema: schema } = require('../helpers/schemaValidation')
const responseStandard = require('../helpers/response')
const paging = require('../helpers/pagination')
const searching = require('../helpers/search')
const sorting = require('../helpers/sort')

module.exports = {
  create: async (req, res) => {
    const { id: userId } = req.data
    const { value: results, error } = schema.validate(req.body)
    if (error) {
      return responseStandard(res, 'Error', { error: error.message }, 400, false)
    } else {
      const { itemsId, qty } = results
      console.log(results);
      const cart = {
        user_id: userId,
        items_id: itemsId,
        qty
      }
      const createCart = await cartModel.createModel(cart)
      if (createCart.affectedRows) {
        const data = {
          id: createCart.insertId,
          ...cart
        }
        console.log(createCart);
        return responseStandard(res, 'Add cart succesfully!', { data: data },200)
      } else {
        return responseStandard(res, 'Failed to add cart', {}, 400, false)
      }
    }
  },
  getAll: async (req, res) => {
    const { id: userId } = req.data
    const { searchKey, searchValue } = searching.name(req.query.search)
    const { sortKey, sortBy } = sorting.name(req.query.sort)
    const count = await cartModel.countModel(userId)
    const page = paging(req, count[0].count)
    const { offset, pageInfo } = page
    const { limitData: limit } = pageInfo

    const results = await cartModel.getModel([searchKey, searchValue, sortKey, sortBy], [userId, limit, offset])
    // console.log(results[0]);
    
    if (results.length) {
      let summary = 0
      Object.values(results).forEach(e => {
        summary += e.price * e.qty
      })
      return responseStandard(res, 'My Cart', { results,summary, pageInfo })
    } else {
      return responseStandard(res, 'There is no product in cart', {}, 404, false)
    }
  },
  editCart: async (req, res) => {
    const { id: userId } = req.data
    const { id: cartId } = req.params
    const { qty } = req.body
    if (qty > 0) {
      const isExist = await cartModel.detailModel([userId, cartId])
      if (!isExist.length) {
        return responseStandard(res, 'You don\'t have this cart', {}, 400, false)
      } else {
        const edit = await cartModel.updateModel([{ qty: qty }, cartId])
        if (edit.affectedRows) {
          return responseStandard(res, 'Update cart succesfully')
        } else {
          return responseStandard(res, 'Failed to update cart', {}, 400, false)
        }
      }
    } else if (qty === '0') {
      const deleteCart = await cartModel.deleteModel([userId, cartId])
      if (deleteCart.affectedRows) {
        return responseStandard(res, 'Product deleted from cart')
      } else {
        return responseStandard(res, 'There is no product in cart', {}, 400, false)
      }
    } else {
      return responseStandard(res, 'Please insert valid value', {}, 400, false)
    }
  },
  deleteCart: async (req, res) => {
    const { id: userId } = req.data
    const { id: cartId } = req.params

    const isExist = await cartModel.detailModel([userId, cartId])
    if (!isExist.length) {
      return responseStandard(res, 'There is no cart', {}, 404, false)
    } else {
      const deleteCart = await cartModel.deleteModel([userId, cartId])
      if (deleteCart.affectedRows) {
        return responseStandard(res, 'Cart deleted')
      } else {
        return responseStandard(res, 'Failed to delete', {}, 400, false)
      }
    }
  }
}
