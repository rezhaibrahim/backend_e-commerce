const router = require('express').Router()
const itemsController = require('../../controllers/items')

router.get('/', itemsController.getItems) // show product
router.get('/new', itemsController.getNewItems)
router.get('/popular', itemsController.getPopularItems)
router.get('/:id', itemsController.detailItems) // show detail product

module.exports = router
