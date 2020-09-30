const router = require('express').Router()
const categoryController = require('../../controllers/category')

// categories
router.get('/category', categoryController.getCategories)
router.get('/category/:id', categoryController.detailCategory)

module.exports = router
