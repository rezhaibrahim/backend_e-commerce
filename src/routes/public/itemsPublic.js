const router = require('express').Router()
const itemsController = require('../../controllers/items')

router.get('/', itemsController.getItems) // show product
router.get('/:id', itemsController.detailProduct) // show detail product

module.exports = router
