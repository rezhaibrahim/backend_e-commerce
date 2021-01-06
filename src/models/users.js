const table = 'users'
const tableDetail = 'userDetail'
const tableRole='role'
const tableGender='gender'
const model = require('../helpers/connectionDB')
const db = require('../helpers/db')
// const column = `${table}.id, ${tableRole}.name AS ${tableRole}, ${tableDetail}.name, ${table}.email, ${table}.password, ${tableDetail}.phone, ${tableGender}.name AS ${tableGender}, ${tableDetail}.birthdate, ${tableDetail}.create_at, ${tableDetail}.update_at`
// const join = `INNER JOIN ${tableDetail} ON ${tableDetail}.user_id=${table}.id INNER JOIN ${tableRole} ON ${tableRole}.id=${table}.role_id INNER JOIN ${tableGender} ON ${tableGender}.id=${tableDetail}.gender_id`
const column = ' userDetail.name, userDetail.email, userDetail.phone, gender.name AS gender, userDetail.birthdate, userDetail.image AS profile_picture'
const join = 'LEFT JOIN  gender ON gender.id=userDetail.gender_id'

module.exports = {
  createUserModel: (data = {}) => { 
    const query = `INSERT INTO ${table} SET ?`
    console.log(query);
    const results = model(query, data)
    return results
  },
  createDetailModel: (data = {}) => { 
    const query = `INSERT INTO ${tableDetail} SET ?`
    const results = model(query, data)
    return results
  },
  checkEmailModel: (data = {}) => { 
    const query = `SELECT * FROM ${table} WHERE ?`
    const results = model(query, data)
    return results
  },
  checkPhoneModel: (data = {}) => { 
    const query = `SELECT * FROM ${tableDetail} WHERE ?`
    const results = model(query, data)
    return results
  },
  // getByCondition: (data = []) => { // no duplicat email
  //   const query = `SELECT * FROM ${table} WHERE ? AND ?`
  //   const results = model(query, data)
  //   return results
  // },
  getUsersModel: (arr, data = []) => { 
    const user = `${table}.id, ${tableRole}.name AS ${tableRole}, ${table}.email, ${table}.password`
    const role = `LEFT JOIN ${tableRole} ON ${tableRole}.id=${table}.role_id`
    const search = `WHERE ${table}.${arr[0]} LIKE '%${arr[1]}%'`
    const query = `SELECT ${user} FROM ${table} ${role} ${search} LIMIT ? OFFSET ?`
    const results = model(query, data)
    return results
  },
  detailUserModel: (data = {}) => { 
    const query = `SELECT ${column} FROM ${tableDetail} ${join} WHERE ${tableDetail}.user_id=?`
    const results = model(query, data)
    return results
  },
  countUsersModel: (arr) => { 
    const search = `WHERE ${arr[0]} LIKE '%${arr[1]}%'`
    const query = `SELECT COUNT(*) as count FROM ${table} ${search}`
    const results = model(query)
    return results
  },
  updateUserModel: (data = []) => { 
    const query = `UPDATE ${table} SET ? WHERE id=?`
    const results = model(query, data)
    return results
  },
  updateDetailModel: (data = []) => { 
    const query = `UPDATE ${tableDetail} SET ? WHERE user_id=?`
    const results = model(query, data)
    return results
  },
  updateUserPartialModel: (data = []) => { // update email and password
    const query = `UPDATE ${table} SET ? WHERE id=?`
    const results = model(query, data)
    return results
  },
  updateCostumerPartialModel: (id, data, cb) => {
    console.log('cek',data);
    db.query(`update ${tableDetail} set ${data} where user_id = ${id}`, (error, result, fields) => {
      cb(error, result)
    })
  },
  getDetailCostumerModel: (id, cb) => {
    db.query(`SELECT ${column} FROM ${tableDetail} ${join} WHERE ${tableDetail}.user_id=${id} `, (error, result, fields) => {
      cb(error, result)
    })
  },
  updateDetailPartialModel: (arr, data = []) => { // update detail (name, picture, phone, gender_id, birthdate)
    const query = `UPDATE ${tableDetail} SET ${arr} WHERE user_id=?`
    const results = model(query, data)
    return results
  },
  deleteUserModel: (data = {}) => { 
    const query = `DELETE FROM ${table} WHERE id=?`
    const results = model(query, data)
    return results
  }
}
