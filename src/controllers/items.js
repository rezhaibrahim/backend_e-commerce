const itemsModel = require('../models/items')
const responseStandard = require('../helpers/response')
const { productSchema: schema } = require('../helpers/schemaValidation')
const searching = require('../helpers/search')
const sorting = require('../helpers/sort')
const paging = require('../helpers/pagination')
const { json } = require('body-parser')

module.exports = {
  create: async (req, res) => {
    const { id: idUser } = req.data
    console.log({id:idUser});
    const { value: results, error } = schema.validate(req.body)
    if (error) {
      return responseStandard(res, 'Error', { error: error.message }, 400, false)
    } else {
      const { name, price, conditionId,categoryId,colorId, description } = results
      let items = {
        seller_id: idUser,
        name,
        price: parseInt(price),
        condition_id: parseInt(conditionId),
        category_id: parseInt(categoryId),
        color_id:parseInt(colorId),
        description,
        
      }
      const createItems = await itemsModel.createModel(items)
      if (createItems.affectedRows) {
        const image = req.files.map(data => {
          return data.path.replace(/\\/g, '/')
        })
        console.log(image);
        const img1 = image[0]
        const img2 = image[1]
        const img3 = image[2]
        const img4 = image[3]
        const id = createItems.insertId
        const createImg = await itemsModel.createPictureModel([id, img1, id, img2, id, img3, id, img4])
        console.log(createImg.affectedRows);
        if (createImg.affectedRows > 0) {
          const data = {
            item_id: createItems.insertId,
            ...items,
            image: {
              img1,
              img2,
              img3,
              img4
            }
          }
          return responseStandard(res, 'image has been created', { data: data })
        }else {
          return responseStandard(res, 'Failed to create product color', {}, 400, false)
        }
      } else {
        return responseStandard(res, 'Failed to create product', {}, 400, false)
      }
    }
  },
  
  getItems: async (req, res) => {
    const { searchKey, searchValue } = searching.name(req.query.search)
    const { sortKey, sortBy } = sorting.name(req.query.sort)
    const count = await itemsModel.countModel([searchKey, searchValue, sortKey, sortBy])
    const page = paging(req, count[0].count)
    const { offset, pageInfo } = page
    const { limitData: limit } = pageInfo

    const results = await itemsModel.getModel([searchKey, searchValue, sortKey, sortBy], [limit, offset])
    if (results.length) {
      return responseStandard(res, 'List of list Items', { results, pageInfo })
    } else {
      return responseStandard(res, 'There is no data in list', {}, 404, false)
    }
  },
  getNewItems: async (req, res) => {
    const { searchKey, searchValue } = searching.name(req.query.search)
    const { sortKey, sortBy } = sorting.name(req.query.sort)
    const count = await itemsModel.countModel([searchKey, searchValue, sortKey, sortBy])
    const page = paging(req, count[0].count)
    const { offset, pageInfo } = page
    const { limitData: limit } = pageInfo

    const results = await itemsModel.getNewModel([searchKey, searchValue, sortKey, sortBy], [limit, offset])
    if (results.length) {
      return responseStandard(res, 'List of list Items', { results, pageInfo })
    } else {
      return responseStandard(res, 'There is no data in list', {}, 404, false)
    }
  },
  getPopularItems: async (req, res) => {
    const { searchKey, searchValue } = searching.name(req.query.search)
    const { sortKey, sortBy } = sorting.name(req.query.sort)
    const count = await itemsModel.countModel([searchKey, searchValue, sortKey, sortBy])
    const page = paging(req, count[0].count)
    const { offset, pageInfo } = page
    const { limitData: limit } = pageInfo

    const results = await itemsModel.getPopularModel([searchKey, searchValue, sortKey, sortBy], [limit, offset])
    if (results.length) {
      return responseStandard(res, 'List of list Items', { results, pageInfo })
    } else {
      return responseStandard(res, 'There is no data in list', {}, 404, false)
    }
  },
  detailItems: async (req, res) => {
    const { id } = req.params
    const results = await itemsModel.detailModel(id)
    const resultsData= results[0]
    const image = await itemsModel.getPicture(id)
    // const image1 = image[0].picture.split()
    // const image2 = image[1].picture.split()
    // const image3 = image[2].picture.split()
    // const image4 = image[3].picture.split()
    // const pictureConvert= image1.concat(image2,image3,image4)
    // const picture=Object.assign({}, pictureConvert)
    const picture = image.map(x => x.picture)
    
    const result={
      ...resultsData,
      picture
    }
    console.log("data:",result);
    console.log(result);
    if (results[0].id !== null) {
      responseStandard(res, `Product with id ${id}`, { result })
    } else {
      responseStandard(res, `Product with id ${id} is not found`, {}, 404, false)
    }
  },
  updateItems: async (req, res) => {
    const { id } = req.params

    let { value: results, error } = schema.validate(req.body)
    if (error) {
      return responseStandard(res, 'Error', { error: error.message }, 400, false)
    } else {
      const { name, price, conditionId, categoryId, description } = results
      const isExist = await itemsModel.detailModel(id)
      if (isExist.length > 0) {
        results = {
          name,
          price: parseInt(price),
          condition_id: parseInt(conditionId),
          category_id: categoryId,
          description
        }
        const updateProduct = await itemsModel.updateModel([results, id])
        if (updateProduct.affectedRows) {
          responseStandard(res, 'Product\'s detail has been updated!')
        } else {
          responseStandard(res, 'Failed to update product!', {}, 304, false)
        }
      } else {
        responseStandard(res, 'Failed to update product!', {}, 304, false)
      }
    }
  },
  deleteItems: async (req, res) => {
    const { id } = req.params

    const isExist = await itemsModel.detailModel(id)
    if (isExist.length > 0) {
      const results = await itemsModel.deleteModel(id)
      if (results.affectedRows) {
        responseStandard(res, `Product with id ${id} has been deleted`)
      } else {
        responseStandard(res, `Failed to delete product with id ${id}`, {}, 500, false)
      }
    } else {
      responseStandard(res, `Product with id ${id} is not found`, {}, 404, false)
    }
  },
  getSellerItems: async (req, res) => {
    const { id } = req.data
    const { searchKey, searchValue } = searching.name(req.query.search)
    const { sortKey, sortBy } = sorting.name(req.query.sort)
    const count = await itemsModel.countModel([searchKey, searchValue])
    const page = paging(req, count[0].count)
    const { offset, pageInfo } = page
    const { limitData: limit } = pageInfo

    const results = await itemsModel.getSellerModel([searchKey, searchValue, sortKey, sortBy], [id, limit, offset])
    if (results.length) {
      return responseStandard(res, 'List of Items', { results, pageInfo })
    } else {
      return responseStandard(res, 'There is no data in list', {}, 404, false)
    }
  },
  detailSellerItems: async (req, res) => {
    const { id } = req.params
    const { id: sellerId } = req.data

    const results = await itemsModel.detailModel([sellerId, id])
    if (results.length) {
      responseStandard(res, `Product with id ${id}`, { results })
    } else {
      responseStandard(res, `Product with id ${id} is not found`, {}, 404, false)
    }
  }
}
