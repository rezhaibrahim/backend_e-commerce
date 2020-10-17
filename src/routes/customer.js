const router = require('express').Router()
const categoryController = require('../controllers/category')
const itemsController = require('../controllers/items')
const usersController = require('../controllers/users')
const cartsController = require('../controllers/cart')
const addressController = require('../controllers/address')
const upload = require('../helpers/upload')

// user detail
router.get('/detail', usersController.getDetailUser) // show user detail
router.put('/edit', upload.single('picture'), usersController.updateUser) // edit user detail
// router.patch('/update', usersController.updateUserPartial) // edit user email & password
// router.patch('/edit/detail', usersController.updateDetailPartial)
router.delete('/delete', usersController.deleteUser) // delete user

// categories
router.get('/category', categoryController.getCategories) // show categories
router.get('/category/:id', categoryController.detailCategory) // show detail category

// itemss
router.get('/items', itemsController.getItems) // show itemss
router.get('/items/:id', itemsController.detailItems) // show detail items

// cart
router.post('/cart', cartsController.create) 
router.get('/cart', cartsController.getAll) 
router.put('/cart/:id', cartsController.editCart) 
router.delete('/cart/:id', cartsController.deleteCart) 


// user address
router.post('/address', addressController.createAddress) 
router.get('/address', addressController.getAllAddress) 
router.get('/address/:id', addressController.detailAddress) 
router.put('/address/:id', addressController.updateAll) 
router.patch('/address/:id', addressController.updatePartial) 
router.delete('/address/:id', addressController.deleteAddress) 

module.exports = router
