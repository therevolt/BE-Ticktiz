const userModels = require("../models/users");
const formatResult = require("../helpers/formatResult");
require("dotenv").config();
let jwt = require("jsonwebtoken");
const sendMail = require("../middlewares/mailer");

module.exports = {
  inputUser: (req, res) => {
    const body = {
      text: "Welcome To Tickitz Website! You Must Verify Email Before Using Your Account!",
      url: `${process.env.HOST}:${process.env.PORT}/v1/users/verify?token=${jwt.sign(
        JSON.parse(JSON.stringify(req.body)),
        process.env.SECRET_KEY_CONFIRM,
        { expiresIn: "1h" }
      )}`,
      textBtn: "Click Here To Verify!",
    };
    sendMail(req.body.email, body)
      .then(() => {
        userModels
          .inputUser(req.body)
          .then(() => {
            formatResult(res, 201, true, "Registration Success, Please Confirm Your Email", null);
          })
          .catch((err) => {
            if (err === "email already registered") {
              formatResult(res, 409, false, err, null);
            } else {
              formatResult(res, 400, false, err, null);
            }
          });
      })
      .catch((err) => {
        formatResult(res, 500, false, err, null);
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
        formatResult(res, 400, false, err, null);
      });
  },
  getUser: (req, res) => {
    userModels
      .getUser(req.query.page, req.query.limit, req.params.userId)
      .then((result) => {
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
        const body = {
          text:
            "You Send Request Change Pass, If It's You Click Link Below, If Not You Ignore This Email",
          url: `RESET PASSWORD ${process.env.HOST}:${
            process.env.PORT
          }/v1/users/confirmReset?token=${jwt.sign(
            JSON.parse(JSON.stringify(result[0])),
            process.env.SECRET_KEY_RESET,
            { expiresIn: "1h" }
          )}`,
          textBtn: "Click Here To Reset Your Password!",
        };
        sendMail(result[0].email, body).then((result) => {
          formatResult(res, 200, true, result, null);
        });
      })
      .catch((err) => {
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
  verifyUser: (req, res) => {
    userModels
      .verifyUser(req.body)
      .then(() => {
        formatResult(res, 200, true, "Success Verify Account", null);
      })
      .catch((err) => {
        formatResult(res, 500, false, err, null);
      });
  },
};
