const table = 'items'
const tableImage = 'image'
const tableCondition='conditions'
const tableColor='color'
const tableCategory='categories'
const tablePicture='image'
const model = require('../helpers/connectionDB')

const column = `${table}.id,${table}.name,price,description, categories.name,conditions.name AS conditions,color.name AS color, image.id AS Image, ${table}.create_at, ${table}.update_at`
const join = `INNER JOIN conditions ON conditions.id=${table}.condition_id 
INNER JOIN image ON image.$items_id=${table}.id 
INNER JOIN categories ON categories.id=${table}.category_id
INNER JOIN color ON color.id=${table}.color_id`

module.exports = {
  createModel: (data = {}) => { // role_id, email, password
    const query = `INSERT INTO ${table} SET ?`
    console.log(query);
    const results = model(query, data)
    return results
  },
  createPictureModel: (data = []) => {
    console.log(data);
    const query = `INSERT INTO ${tablePicture} (items_id, picture) VALUES (?, ?), (?, ?), (?, ?), (?, ?)`
    const results = model(query, data)
    return results
  },
  countModel: (arr) => {
    const query = `SELECT COUNT(*) as count FROM ${table} WHERE items.${arr[0]} LIKE '%${arr[1]}%' ORDER BY ${arr[2]} ${arr[3]}`
    const results = model(query)
    return results
  },
  getModel: (arr, data = []) => {
    const query = `SELECT ${column} FROM ${table} ${join} WHERE items.${arr[0]} LIKE '%${arr[1]}%' ORDER BY ${arr[2]} ${arr[3]} LIMIT ? OFFSET ?`
    const results = model(query, data)
    return results
  },
  detailModel: (data = {}) => {
    const query = `SELECT ${column} FROM ${table} ${join} WHERE ${table}.id=?`
    const results = model(query, data)
    return results
  },
  updateModel: (data = []) => {
    const query = `UPDATE ${table} SET ? WHERE ?`
    const results = model(query, data)
    return results
  },
  updateColorModel: (data = []) => {
    const query = `UPDATE ${tableColor} SET ? WHERE ?`
    const results = model(query, data)
    return results
  },
  // updatePictModel: (data = []) => {
  //   const query = `UPDATE ${tablePict} SET (image) VALUES (?), (?), (?), (?) WHERE color_id=?`
  //   const results = model(query, data)
  //   return results
  // },
  deleteModel: (data = {}) => {
    const query = `DELETE FROM ${table} WHERE id = ?`
    const results = model(query, data)
    return results
  },
  getSellerModel: (arr, data = []) => {
    const query = `SELECT ${column} FROM ${table} ${join} WHERE items.seller_id=? AND items.${arr[0]} LIKE '%${arr[1]}%' ORDER BY ${arr[2]} ${arr[3]} LIMIT ? OFFSET ?`
    console.log(query);
    const results = model(query, data)
    return results
  },
  detailSellerModel: (data = []) => {
    const query = `SELECT ${column} FROM ${table} ${join} WHERE items.seller_id=? ${table}.id=?`
    const results = model(query, data)
    return results
  }
}
