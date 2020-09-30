const router = require('express').Router()
const usersController = require('../controllers/users')
const itemsController = require('../controllers/items')
const storesController = require('../controllers/store')
const upload = require('../helpers/upload')

// user detail
router.get('/detail', usersController.getDetailUser) // users
router.put('/edit', usersController.updateUser) // users and user_details
router.delete('/delete', usersController.deleteUser) // users

// stores
router.put('/store', storesController.updateStore) // update store detail

// Items
router.post('/items',upload.array('picture', 4), itemsController.create) // add items
// router.post('/items/color', upload.array('picture', 4), itemsController.createColor) // add items
router.get('/items', itemsController.getSellerProducts) // show items
router.get('/items/:id', itemsController.detailSellerProduct) // show detail items
router.put('/items/:id', itemsController.updateProduct) // edit items
// router.put('/items/color/:id', upload.array('picture', 4), itemsController.updateColorProduct) // edit items
router.delete('/items/:id', itemsController.deleteProduct) // delete items

module.exports = router
