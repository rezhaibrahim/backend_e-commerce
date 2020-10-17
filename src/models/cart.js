const table = 'carts'
const tableUser = 'users'
const tableItem = 'items'
const tableImage = 'image'
const model = require('../helpers/connectionDB')

const column =`${table}.id,qty,item, price, picture`
const join=`
INNER JOIN ${tableUser} ON ${tableUser}.id = ${table}.user_id
INNER JOIN (  
  SELECT ${tableItem}.id AS itemImage_id,${tableItem}.name AS Item,price,${tableImage}.picture as picture 
  FROM ${tableItem}
  INNER JOIN ${tableImage}
  ON ${tableImage}.items_id=${tableItem}.id  
  GROUP BY ${tableItem}.id
) itemImage ON  itemImage.itemImage_id = ${table}.items_id
`
module.exports = {
  createModel: (data = {}) => {
    const query = `INSERT INTO ${table} SET ?`
    const results = model(query, data)
    return results
  },
  countModel: (data = {}) => {
    const query = `SELECT COUNT(*) as count FROM ${table} WHERE user_id=?`
    const results = model(query, data)
    return results
  },
  getModel: (arr, data = []) => {
    const query = `SELECT ${column} FROM ${table} ${join} WHERE user_id=? LIMIT ? OFFSET ?`
    const results = model(query, data)
    return results
  },
  detailModel: (data = []) => {
    const query = `SELECT * FROM ${table} WHERE user_id=? AND id=?`
    const results = model(query, data)
    return results
  },
  updateModel: (data = []) => {
    const query = `UPDATE ${table} SET ? WHERE id = ?`
    const results = model(query, data)
    return results
  },
  deleteModel: (data = []) => {
    const query = `DELETE FROM ${table} WHERE user_id=? AND id = ?`
    const results = model(query, data)
    return results
  }
}
