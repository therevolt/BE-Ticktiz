const userModels = require('../models/users')
const formatResult = require('../helpers/formatResult')

module.exports = {
  inputUser: (req, res) => {
    userModels
      .inputUser(req.body)
      .then(() => {
        formatResult(res, 201, true, 'success register', req.body)
      })
      .catch((err) => {
        formatResult(res, 400, false, err, null)
      })
  },
  getUserByUserId: (req, res) => {
    userModels.getUserByUserId(req.params.userId).then((result) => {
      formatResult(res, 200, true, `success ${result.length} data found`, result)
    })
  },
  editUserByUserId: (req, res) => {
    userModels.editUserByUserId(req.body, req.params.userId).then((result) => {
      formatResult(res, 200, true, 'success update data', result)
    })
  }
}
