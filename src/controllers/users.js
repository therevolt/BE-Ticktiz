const userModels = require("../models/users");
const formatResult = require("../helpers/formatResult");

module.exports = {
  inputUser: (req, res) => {
    userModels
      .inputUser(req.body)
      .then(() => {
        formatResult(res, 201, true, "success register", req.body);
      })
      .catch((err) => {
        if (err === "email already registered") {
          formatResult(res, 409, false, err, null);
        } else {
          formatResult(res, 400, false, err, null);
        }
      });
  },
  getUserByUserId: (req, res) => {
    userModels.getUserByUserId(req.params.userId).then((result) => {
      if (result.length >= 1) {
        formatResult(res, 200, true, `success ${result.length} data found`, result);
      } else {
        formatResult(res, 404, false, `data not found`, null);
      }
    });
  },
  editUserByUserId: (req, res) => {
    userModels
      .editUserByUserId(req.body, req.params.userId)
      .then((result) => {
        formatResult(res, 200, true, "success update data", result);
      })
      .catch((err) => {
        formatResult(res, 400, false, err, null);
      });
  },
  deleteUserByUserId: (req, res) => {
    userModels
      .deleteUserByUserId(req.params.userId)
      .then((result) => {
        formatResult(res, 404, true, "success delete user", result);
      })
      .catch((err) => {
        if (err === "error endpoint") {
          formatResult(res, 500, false, err, null);
        } else {
          formatResult(res, 404, false, err, null);
        }
      });
  },
};
