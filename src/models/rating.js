const table = 'rating'
const model = require('../helpers/connectionDB')

module.exports = {
  createModel: (data = {}) => {
    const query = `INSERT INTO ${table} SET ?`
    const results = model(query, data)
    return results
  }
}
