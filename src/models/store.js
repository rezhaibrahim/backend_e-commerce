const table = 'store'
const model = require('../helpers/connectionDB')

module.exports = {
  createModel: (data = {}) => {
    const query = `INSERT INTO ${table} SET ?`
    console.log(query);
    const results = model(query, data)
    return results
  },
  updateModel: (data = []) => {
    const query = `UPDATE ${table} SET ? WHERE ?`
    const results = model(query, data)
    return results
  }
}
