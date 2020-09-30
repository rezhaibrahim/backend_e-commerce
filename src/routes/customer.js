const router = require('express').Router()
const categoryController = require('../controllers/category')
const itemsController = require('../controllers/items')
const usersController = require('../controllers/users')
const cartsController = require('../controllers/cart')
const upload = require('../helpers/upload')

// user detail
router.get('/detail', usersController.getDetailUser) // show user detail
router.put('/edit', upload.single('picture'), usersController.updateUser) // edit user detail
router.delete('/delete', usersController.deleteUser) // delete user

// categories
router.get('/category', categoryController.getCategories) // show categories
router.get('/category/:id', categoryController.detailCategory) // show detail category

// products
router.get('/product', itemsController.getItems) // show products
router.get('/product/:id', itemsController.detailProduct) // show detail product

// cart
router.post('/cart', cartsController.create) // add cart
router.get('/cart', cartsController.getAll) // show cart
router.put('/cart/:id', cartsController.editCart) // edit cart
router.delete('/cart/:id', cartsController.deleteCart) // delete cart

module.exports = router
