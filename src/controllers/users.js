const usersModel = require('../models/users')
const paging = require('../helpers/pagination')
const searching = require('../helpers/search')
const responseStandard = require('../helpers/response')
const { custSchema: schemaC } = require('../helpers/schemaValidation')
const bcrypt = require('bcrypt')

module.exports = {
  create: async (req, res) => {
    if (req.fileValidationError) {
      return responseStandard(res, 'Error', { error: req.fileValidationError }, 500, false)
    }
    const picture = `/uploads/${req.file.filename}`
    console.log(picture)

    const { value: results, error } = schemaC.validate(req.body)
    if (error) {
      return responseStandard(res, 'Error', { error: error.message }, 400, false)
    } else {
      const { roleId, name, email, password, phone, genderId, birthdate } = results
      const isExist = await usersModel.checkEmailModel({ email })
      if (!isExist.length) {
        const isExist = await usersModel.checkPhoneModel({ phone })
        if (!isExist.length) {
          const salt = await bcrypt.genSalt(10)
          const hashedPassword = await bcrypt.hash(password, salt)
          const users = {
            role_id: roleId,
            email: email,
            password: hashedPassword
          }
          const createUser = await usersModel.createUserModel(users)
          if (createUser.affectedRows) {
            const detail = {
              user_id: createUser.insertId,
              name: name,
              image: picture,
              phone: phone,
              gender_id: genderId,
              birthdate: birthdate
            }
            const createDetail = await usersModel.createDetailModel(detail)
            if (createDetail.affectedRows) {
              const data = {
                ...users,
                ...detail,
                password: null
              }
              return responseStandard(res, 'Success! User has been created!', { data: data })
            } else {
              return responseStandard(res, 'Failed to create user!', {}, 400, false)
            }
          } else {
            return responseStandard(res, 'Failed to create user!', {}, 400, false)
          }
        } else {
          return responseStandard(res, 'Phone has already used', {}, 400, false)
        }
      } else {
        return responseStandard(res, 'Email has already used', {}, 400, false)
      }
    }
  },
  getAll: async (req, res) => {
    const { searchKey, searchValue } = searching.email(req.query.search)
    const count = await usersModel.countUsersModel([searchKey, searchValue])
    const page = paging(req, count[0].count)
    const { offset, pageInfo } = page
    const { limitData: limit } = pageInfo

    const results = await usersModel.getUsersModel([searchKey, searchValue], [limit, offset])
    if (results.length) {
      const data = results.map(data => {
        data = {
          ...data,
          password: null
        }
        return data
      })
      return responseStandard(res, 'List of Users', { data, pageInfo })
    } else {
      return responseStandard(res, 'There is no user in list', {}, 404, false)
    }
  },
  getDetailUser: async (req, res) => {
    const { id } = req.data

    const results = await usersModel.detailUserModel(id)
    if (results.length) {
      const data = results.map(data => {
        data = {
          ...data,
          password:null
        }
        return data
      })
      responseStandard(res, `Detail of user id ${id}`, { data })
    } else {
      responseStandard(res, `User with id ${id} is not found`, {}, 404, false)
    }
  },
  updateUser: async (req, res) => {
    if (req.fileValidationError) {
      return responseStandard(res, 'Error', { error: req.fileValidationError }, 500, false)
    }
    const picture = `/uploads/${req.file.filename}`
    console.log(picture)

    const { id } = req.data
    const { value: results, error } = schemaC.validate(req.body)
    if (error) {
      return responseStandard(res, 'Error', { error: error.message }, 400, false)
    } else {
      const { roleId, name, email, password, phone, genderId, birthdate } = results
      const isExist = await usersModel.checkEmailModel({ email })
      console.log(isExist)
      let existEmail = 0
      if (isExist.length) {
        existEmail = isExist[0].id
      }
      if (existEmail === parseInt(id) || !isExist.length) {
        if (results === isExist[0]) {
          return responseStandard(res, 'There is no change', {}, 304, false)
        } else {
          const isExist = await usersModel.checkPhoneModel({ phone })
          let existPhone = 0
          if (isExist.length) {
            existPhone = isExist[0].user_id
          }
          console.log(isExist, existPhone, id)
          if (existPhone === parseInt(id) || !isExist.length) {
            const salt = await bcrypt.genSalt(10)
            const hashedPassword = await bcrypt.hash(password, salt)
            const users = {
              role_id: roleId,
              email: email,
              password: hashedPassword
            }
            const updateUser = await usersModel.updateUserModel([users, id])
            if (updateUser.affectedRows) {
              const detail = {
                user_id: id,
                name: name,
                picture: picture,
                phone: phone_number,
                gender_id: genderId,
                birthdate: birthdate
              }
              const updateDetail = await usersModel.updateDetailModel([detail, id])
              if (updateDetail.affectedRows) {
                return responseStandard(res, 'Success! User has been updated!')
              } else {
                return responseStandard(res, 'Failed to update user!', {}, 400, false)
              }
            } else {
              return responseStandard(res, 'Failed to update user!', {}, 400, false)
            }
          } else {
            return responseStandard(res, 'Phone number has already used', {}, 400, false)
          }
        }
      } else {
        return responseStandard(res, 'Email has already used', {}, 400, false)
      }
    }
  },
  deleteUser: async (req, res) => {
    const { id } = req.data

    const isExist = await usersModel.detailUserModel(id)
    if (isExist.length > 0) {
      const results = await usersModel.deleteUserModel(id)
      if (results.affectedRows) {
        return responseStandard(res, 'User has been deleted')
      } else {
        return responseStandard(res, 'Failed to delete! Try again later!', {}, 500, false)
      }
    } else {
      return responseStandard(res, 'User not found', {}, 404, false)
    }
  },
  getDetailForAdmin: async (req, res) => {
    const { id } = req.params

    const results = await usersModel.detailUserModel(id)
    if (results.length) {
      const data = results.map(item => {
        item = {
          ...item,
          password: null
        }
        return item
      })
      responseStandard(res, `Detail of user id ${id}`, { data })
    } else {
      responseStandard(res, `User with id ${id} is not found`, {}, 404, false)
    }
  },
  deleteUserForAdmin: async (req, res) => {
    const { id } = req.params

    const isExist = await usersModel.detailUserModel(id)
    if (isExist.length > 0) {
      const results = await usersModel.deleteUserModel(id)
      if (results.affectedRows) {
        return responseStandard(res, 'User has been deleted')
      } else {
        return responseStandard(res, 'Failed to delete! Try again later!', {}, 500, false)
      }
    } else {
      return responseStandard(res, 'User not found', {}, 404, false)
    }
  },
  createAdmin: async (req, res) => {
    const { roleId, email, password } = req.body
console.log(roleId,email);
    if (roleId && email && password) {
      const isExist = await usersModel.checkEmailModel({ email })
      if (!isExist.length) {
        const salt = await bcrypt.genSalt(10)
        const hashedPassword = await bcrypt.hash(password, salt)
        const users = {
          role_id: roleId,
          email: email,
          password: hashedPassword
        }
        console.log(users);
        const createUser = await usersModel.createUserModel(users)
        console.log(createUser);
        if (createUser.affectedRows) {
          return responseStandard(res, 'Success! Admin User has been created!', { data: users })
        } else {
          return responseStandard(res, 'Failed to create user!', {}, 400, false)
        }
      } else {
        return responseStandard(res, 'Email has already used', {}, 400, false)
      }
    } else {
      return responseStandard(res, 'All fields must be filled!', {}, 400, false)
    }
  }
}
