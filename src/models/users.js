const table = 'users'
const tableDetail = 'userDetail'
const tableRole='role'
const tableGender='gender'
const model = require('../helpers/connectionDB')

const column = `${table}.id, ${tableRole}.name AS ${tableRole}, ${tableDetail}.name, ${table}.email, ${table}.password, ${tableDetail}.phone, ${tableGender}.name AS ${tableGender}, ${tableDetail}.birthdate, ${tableDetail}.create_at, ${tableDetail}.update_at`
const join = `INNER JOIN ${tableDetail} ON ${tableDetail}.user_id=${table}.id INNER JOIN ${tableRole} ON ${tableRole}.id=${table}.role_id INNER JOIN ${tableGender} ON ${tableGender}.id=${tableDetail}.gender_id`

module.exports = {
  createUserModel: (data = {}) => { // role_id, email, password
    const query = `INSERT INTO ${table} SET ?`
    console.log(query);
    const results = model(query, data)
    return results
  },
  createDetailModel: (data = {}) => { // user_id, name, picture, phone, gender_id, birthdate
    const query = `INSERT INTO ${tableDetail} SET ?`
    const results = model(query, data)
    return results
  },
  checkEmailModel: (data = {}) => { // no duplicat email
    const query = `SELECT * FROM ${table} WHERE ?`
    const results = model(query, data)
    return results
  },
  checkPhoneModel: (data = {}) => { // no duplicat email
    const query = `SELECT * FROM ${tableDetail} WHERE ?`
    const results = model(query, data)
    return results
  },
  // getByCondition: (data = []) => { // no duplicat email
  //   const query = `SELECT * FROM ${table} WHERE ? AND ?`
  //   const results = model(query, data)
  //   return results
  // },
  getUsersModel: (arr, data = []) => { // get all user (id, role, email, password)
    const user = `${table}.id, ${tableRole}.name AS ${tableRole}, ${table}.email, ${table}.password`
    const role = `LEFT JOIN ${tableRole} ON ${tableRole}.id=${table}.role_id`
    const search = `WHERE ${table}.${arr[0]} LIKE '%${arr[1]}%'`
    const query = `SELECT ${user} FROM ${table} ${role} ${search} LIMIT ? OFFSET ?`
    const results = model(query, data)
    return results
  },
  detailUserModel: (data = {}) => { // get detail user (id, role, email, password, name, picture, phone, gender_id, birthdate)
    const query = `SELECT ${column} FROM ${table} ${join} WHERE users.id=?`
    const results = model(query, data)
    return results
  },
  countUsersModel: (arr) => { // count for paging
    const search = `WHERE ${arr[0]} LIKE '%${arr[1]}%'`
    const query = `SELECT COUNT(*) as count FROM ${table} ${search}`
    const results = model(query)
    return results
  },
  updateUserModel: (data = []) => { // update email and password
    const query = `UPDATE ${table} SET ? WHERE id=?`
    const results = model(query, data)
    return results
  },
  updateDetailModel: (data = []) => { // update detail (name, picture, phone, gender_id, birthdate)
    const query = `UPDATE ${tableDetail} SET ? WHERE user_id=?`
    const results = model(query, data)
    return results
  },
  deleteUserModel: (data = {}) => { // delete user by id
    const query = `DELETE FROM ${table} WHERE id=?`
    const results = model(query, data)
    return results
  }
}
