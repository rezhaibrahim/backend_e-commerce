require('dotenv').config()
const { APP_PORT } = process.env
const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const app = express()

// middleware
app.use(bodyParser.urlencoded({ extended: false }))
app.use(cors())

// import middleware
const {
  authAdmin, authSeller, authCust
} = require('./src/middleware/auth')

// provide static files
app.use('/uploads', express.static('assets/uploads/'))

// import route
// const homeRouter = require('./src/routes/public/homeRoutes')
const categoriesRouter = require('./src/routes/public/categoryPublic')
const productRouter = require('./src/routes/public/itemsPublic')
const newProdRouter = require('./src/routes/public/conditionPublic')
const authRouter = require('./src/routes/public/authPublic')
const adminRouter = require('./src/routes/admin')
const sellerRouter = require('./src/routes/seller')
const custRouter = require('./src/routes/customer')

// app.use('/home', homeRouter)
app.use('/category', categoriesRouter)
app.use('/product', productRouter)
app.use('/new', newProdRouter)
app.use('/auth', authRouter)
app.use('/admin', authAdmin, adminRouter)
app.use('/seller', authSeller, sellerRouter)
app.use('/customer', authCust, custRouter)

app.listen(APP_PORT, () => {
  console.log(`App listening on port ${APP_PORT}`)
})
