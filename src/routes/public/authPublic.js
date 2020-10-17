const router = require('express').Router()
const { authAdminController, authSellerController, authCustController } = require('../../controllers/auth')
const usersController = require('../../controllers/users')
const storesController = require('../../controllers/store')

const upload = require('../../helpers/upload')
// login
router.post('/login/admin', authAdminController) // admin
router.post('/login/seller', authSellerController) // seller
router.post('/login/customer', authCustController) // customer

// register
router.post('/register/seller', storesController.createStore) // seller
router.post('/register/customer', usersController.createCustomer) // customer
module.exports = router
