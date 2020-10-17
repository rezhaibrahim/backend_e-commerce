const joi = require('joi')

module.exports = {
  custSchema: joi.object({
    name: joi.string().required().replace(/'/g, "\'").replace(/"/g, '\"'),
    email: joi.string().required(),
    password: joi.string().required()
  }),
  updateCustSchema: joi.object({
    name: joi.string().required().replace(/'/g, "\'").replace(/"/g, '\"'),
    email: joi.string().required(),
    password: joi.string().required(),
    phone: joi.string().required(),
    genderId: joi.string().required(),
    birthdate: joi.string().required()
  }),
  sellerSchema: joi.object({
    name: joi.string().required(),
    email: joi.string().required(),
    phone: joi.number().required(),
    storeName: joi.string().required().replace(/'/g, "\'").replace(/"/g, '\"'),
    password: joi.string().required()
  }),
  productSchema: joi.object({
    name: joi.string().required().replace(/'/g, "\'").replace(/"/g, '\"'),
    price: joi.string().required(),
    conditionId: joi.string().required(),
    categoryId: joi.string().required(),
    colorId: joi.string().required(),
    description: joi.string().required().replace(/'/g, "\'").replace(/"/g, '\"')
  }),
  cartSchema: joi.object({
    itemsId: joi.number().required(),
    qty: joi.number().required()
  }),
  categorySchema: joi.object({
    categoryId: joi.number().required(),
    name: joi.string().required().replace(/'/g, "\'").replace(/"/g, '\"')
  }),
  addressSchema: joi.object({
    name: joi.string().required().replace(/'/g, "\'").replace(/"/g, '\"'),
    recipientName: joi.string().required().replace(/'/g, "\'").replace(/"/g, '\"'),
    recipientPhone: joi.number().required(),
    address: joi.string().required().replace(/'/g, "\'").replace(/"/g, '\"'),
    postalCode: joi.number().required(),
    city: joi.string().required().replace(/'/g, "\'").replace(/"/g, '\"')
  })
}


