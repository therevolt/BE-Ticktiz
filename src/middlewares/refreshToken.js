const jwt = require("jsonwebtoken");
const formatResult = require("../helpers/formatResult");
require("dotenv").config(); // Import env Config

const refreshToken = (req, res, next) => {
  const auth = req.body.refreshToken;
  if (auth) {
    const token = auth.split(" ")[1];
    jwt.verify(token, process.env.SECRET_KEY_REFRESH, function (err, decoded) {
      if (!err) {
        req.role = decoded.role;
        next();
      } else {
        if (err.message === "jwt malformed") {
          formatResult(res, 500, false, "Invalid Token", null);
        } else if (err.message === "jwt expired") {
          formatResult(res, 500, false, "Token Expired", null);
        } else {
          formatResult(req, 500, false, "Invalid Signature", null);
        }
      }
    });
  } else {
    formatResult(res, 500, false, "Unauthorized", "refreshToken Needed");
  }
};

module.exports = refreshToken;
