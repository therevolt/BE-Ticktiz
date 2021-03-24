const userModels = require("../models/users");
const formatResult = require("../helpers/formatResult");
require("dotenv").config();
let jwt = require("jsonwebtoken");
const sendMail = require("../middlewares/mailer");

module.exports = {
  inputUser: (req, res) => {
    console.log(req.body);
    userModels
      .inputUser(req.body)
      .then((result) => {
        delete result[0].password;
        formatResult(res, 201, true, "Success Register", result);
      })
      .catch((err) => {
        if (err === "email already registered") {
          formatResult(res, 409, false, err, null);
        } else {
          formatResult(res, 400, false, err, null);
        }
      });
  },
  loginUser: (req, res) => {
    userModels
      .loginUser(req.body.email, req.body.password)
      .then((result) => {
        delete result[0].password;
        formatResult(res, 200, true, "Login Success", [
          {
            ...result[0],
            token: jwt.sign(JSON.parse(JSON.stringify(result[0])), process.env.SECRET_KEY, {
              expiresIn: "1h",
            }),
            refreshToken: jwt.sign(
              JSON.parse(JSON.stringify(result[0])),
              process.env.SECRET_KEY_REFRESH,
              {
                expiresIn: "3d",
              }
            ),
          },
        ]);
      })
      .catch((err) => {
        console.log(err);
        formatResult(res, 400, false, err, null);
      });
  },
  getUser: (req, res) => {
    userModels
      .getUser(req.query.page, req.query.limit, req.params.userId)
      .then((result) => {
        console.log(result);
        if (result.length >= 1) {
          delete result[0].password;
          formatResult(res, 200, true, `success ${result.length} data found`, result);
        } else if (typeof result === "object") {
          formatResult(res, 200, true, "success", result);
        } else {
          formatResult(res, 404, false, "data not found", null);
        }
      })
      .catch((err) => {
        if (req.query.page && req.query.limit) {
          formatResult(res, 409, false, "Page or limit exceeds the existing data", err);
        } else {
          formatResult(res, 500, false, "Internal Server Error", err);
        }
      });
  },
  editUserByUserId: (req, res) => {
    console.log(req.body);
    userModels
      .editUserByUserId(req.body, req.params.userId)
      .then((result) => {
        delete result[0].password;
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
  resetPassword: (req, res) => {
    userModels
      .resetPassword(req.body)
      .then((result) => {
        delete result[0].password;
        sendMail(
          result[0].email,
          `RESET PASSWORD ${process.env.HOST}:${
            process.env.PORT
          }/v1/users/confirmReset?token=${jwt.sign(
            JSON.parse(JSON.stringify(result[0])),
            process.env.SECRET_KEY_RESET,
            { expiresIn: "1h" }
          )}`
        ).then((result) => {
          formatResult(res, 200, true, result, null);
        });
      })
      .catch((err) => {
        console.log(err);
        formatResult(res, 400, false, err, null);
      });
  },
  confirmResetPassword: (req, res) => {
    userModels
      .confirmResetPassword(req.body, req.email)
      .then((result) => {
        delete result[0].password;
        formatResult(res, 200, true, "Success Reset Password", result);
      })
      .catch((err) => {
        formatResult(res, 500, false, err, null);
      });
  },
};
