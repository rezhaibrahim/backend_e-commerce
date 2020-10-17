const router = require('express').Router()
const categoriesController = require('../../controllers/category')
// categories
router.get('/', categoriesController.getCategories)
router.get('/:id', categoriesController.detailCategory)

module.exports = router
