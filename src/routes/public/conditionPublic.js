const router = require('express').Router()
const conditionController = require('../../controllers/condition')

router.get('/', conditionController.getCondition) // show new product
router.get('/:id', conditionController.detailCondition) // show detail product

module.exports = router
