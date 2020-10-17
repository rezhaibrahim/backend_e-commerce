const categoriesModel = require('../models/category')
const responseStandard = require('../helpers/response')
const searching = require('../helpers/search')
const sorting = require('../helpers/sort')
const paging = require('../helpers/pagination')
const { categorySchema: schemaS } = require('../helpers/schemaValidation')

module.exports = {
  create:async (req, res) => {
    if (req.fileValidationError) {
      return responseStandard(res, 'Error', { error: req.fileValidationError }, 500, false)
    }
    const image = `/uploads/${req.file.filename}`
    console.log(image)

    const { value: results, error } = schemaS.validate(req.body)
    if (error) {
      return responseStandard(res, 'Error', { error: error.message }, 400, false)
    } else {
      const { categoryId, name } = results
      console.log(results);
      const category ={
        id:categoryId,
        name:name,
        image:image
      }
      console.log(category);
          const createCategory = await categoriesModel.createModel(category)
          console.log(createCategory);
          
            if (createCategory.affectedRows) {
              const data = {
                  id: createCategory.insertId,
                 ...category
              }
              return responseStandard(res, 'Success! category has been created!', { data: data })
            } else {
              return responseStandard(res, 'Failed to create category!', {}, 400, false)
            }
    }
  },
  getCategories: async (req, res) => {
    const { searchKey, searchValue } = searching.name(req.query.search)
    const { sortKey, sortBy } = sorting.name(req.query.sort)
    const count = await categoriesModel.countModel()
    console.log("cek:",count);
    const page = paging(req, count[0].count)
    const { offset, pageInfo } = page
    const { limitData: limit } = pageInfo
    
    console.log(limit);
    const results = await categoriesModel.getModel([searchKey, searchValue, sortKey, sortBy], [limit, offset])
    if (results.length) {
      return responseStandard(res, 'List of Roles', { results, pageInfo })
    } else {
      return responseStandard(res, 'There is no item in list', {}, 404, false)
    }
  },
  detailCategory: async (req, res) => {
    const { id } = req.params
    const { searchKey, searchValue } = searching.name(req.query.search)
    const { sortKey, sortBy } = sorting.name(req.query.sort)
    const count = await categoriesModel.countModel()
    console.log("cek:",count);
    const page = paging(req, count[0].count)
    const { pageInfo } = page
    const { limitData: limit } = pageInfo

    const results = await categoriesModel.detailModel([id,searchKey, searchValue, sortKey, sortBy], [limit])
    const name=results[0].name
    if (results.length) {
      // console.log(results[0].name);
      responseStandard(res, `${name}`, { results, pageInfo })
    } else {
      responseStandard(res, `Category with id ${id} is not found`, {}, 404, false)
    }
  },
  changeName: async (req, res) => {
    const { id } = req.params
    const { name } = req.body

    const isExist = await categoriesModel.detailModel(id)
    if (isExist.length > 0) {
      const results = await categoriesModel.updateModel([name, id])
      if (results.affectedRows) {
        responseStandard(res, 'Category\'s name has been updated!')
      } else {
        responseStandard(res, 'Failed to update name!', {}, 304, false)
      }
    } else {
      responseStandard(res, `Category with id ${id} is not found`, {}, 404, false)
    }
  },
  deleteRole: async (req, res) => {
    const { id } = req.params

    const isExist = await categoriesModel.detailModel(id)
    if (isExist.length > 0) {
      const results = await categoriesModel.deleteModel(id)
      if (results.affectedRows) {
        responseStandard(res, `Category with id ${id} has been deleted`)
      } else {
        responseStandard(res, `Failed to delete category with id ${id}`, {}, 500, false)
      }
    } else {
      responseStandard(res, `Category with id ${id} is not found`, {}, 404, false)
    }
  }
}
