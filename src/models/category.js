const table2 = 'categories'
const model = require('../helpers/connectionDB')
const table = 'items'
module.exports = {
  createModel: (data = {}) => {
    const query = `INSERT INTO ${table} SET ?`
    console.log(query);
    const results = model(query, data)
    return results
  },
  countModel: () => {
    const query = `SELECT COUNT(*) as count FROM ${table}`
    console.log(query);
    const results = model(query)
    return results
  },
  getModel: (arr, data = []) => {
    const query = `SELECT * FROM ${table2} WHERE ${arr[0]} LIKE '%${arr[1]}%' ORDER BY ${arr[2]} ${arr[3]} LIMIT ? OFFSET ?`
    const results = model(query, data)
    return results
  },
  detailModel: (data = {}) => {
    const query = `SELECT categories.name,items.name AS itemName,price,description, categories.name AS category,conditions.name AS conditions,color.name AS color,image.picture AS picture, items.create_at, items.update_at FROM items INNER JOIN conditions ON conditions.id=items.condition_id INNER JOIN categories ON categories.id=items.category_id INNER JOIN color ON color.id=items.color_id INNER JOIN image ON image.items_id=items.id WHERE categories.id =? GROUP BY items.id ORDER BY items.name ASC LIMIT 10 `
    const results = model(query, data)
    return results
  },
  updateModel: (data = []) => {
    const query = `UPDATE ${table} SET name = ? WHERE id = ?`
    const results = model(query, data)
    return results
  },
  deleteModel: (data = {}) => {
    const query = `DELETE FROM ${table} WHERE id = ?`
    const results = model(query, data)
    return results
  },
}
