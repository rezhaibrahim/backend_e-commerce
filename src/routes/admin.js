const router = require('express').Router()
const rolesController = require('../controllers/role')
const conditionsController = require('../controllers/condition')
const colorsController = require('../controllers/color')
const usersController = require('../controllers/users')
const categoriesController = require('../controllers/category')
const itemsController = require('../controllers/items')

const upload = require('../helpers/upload')
// roles
router.post('/roles', rolesController.create) // add roles
router.get('/roles', rolesController.getRoles) // show roles
router.get('/roles/:id', rolesController.detailRole) // show detail roles
router.put('/roles/:id', rolesController.updateRole) // edit roles
router.delete('/roles/:id', rolesController.deleteRole) // delete roles
// color
router.post('/color', colorsController.create) // add color
router.get('/color', colorsController.getColor) // show color
router.get('/color/:id', colorsController.detailColor) // show detail color
router.put('/color/:id', colorsController.updateColor) // edit color
router.delete('/color/:id', colorsController.deleteColor) // delete color
// Condition
router.post('/condition', conditionsController.create) // add condition
router.get('/condition', conditionsController.getCondition) // show condition
router.get('/condition/:id', conditionsController.detailCondition) // show detail condition
router.put('/condition/:id', conditionsController.updateCondition) // edit condition
router.delete('/condition/:id', conditionsController.deleteCondition) // delete Condition

// users
router.post('/users', usersController.createAdmin) // users
router.get('/users', usersController.getAll) // users
router.get('/users/:id', usersController.getDetailForAdmin) // users
router.delete('/users/:id', usersController.deleteUserForAdmin) // users

// categories
router.post('/category', upload.single('picture'), categoriesController.create) // add category
router.get('/category', categoriesController.getCategories) // show category
router.get('/category/:id', categoriesController.detailCategory) // show detail category
router.put('/category/:id', categoriesController.changeName) // edit category
router.delete('/category/:id', categoriesController.deleteRole) // delete category

// Items
router.post('items/', itemsController.create) // add Items
router.get('items/', itemsController.getItems) // show Items
router.get('items/:id', itemsController.detailItems) // show detail Items
router.put('items/:id', itemsController.updateItems) // edit Items
router.delete('items/:id', itemsController.deleteItems) // delete Items

module.exports = router
