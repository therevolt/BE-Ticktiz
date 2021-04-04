const jwt = require("jsonwebtoken");
const formatResult = require("../helpers/formatResult");
require("dotenv").config(); // Import env Config

const Auth = (req, res, next) => {
  const auth = req.headers.authorization;
  if (auth) {
    const token = auth.split(" ")[1];
    jwt.verify(token, process.env.SECRET_KEY, function (err, decoded) {
      if (!err) {
        req.role = decoded.role;
        next();
      } else {
        if (err.message === "jwt malformed") {
          formatResult(res, 400, false, "Invalid Token", null);
        } else if (err.message === "jwt expired") {
          formatResult(res, 400, false, "Token Expired", null);
        } else {
          formatResult(req, 400, false, "Invalid Signature", null);
        }
      }
    });
  } else {
    formatResult(res, 400, false, "Unauthorized", "Token Needed");
  }
};

const AuthAdmin = (req, res, next) => {
  const auth = req.headers.authorization;
  if (auth) {
    const token = auth.split(" ")[1];
    jwt.verify(token, process.env.SECRET_KEY, function (err, decoded) {
      if (!err) {
        if (decoded.role === "admin") {
          next();
        } else {
          formatResult(res, 400, false, "Admin Only", null);
        }
      } else {
        if (err.message === "jwt malformed") {
          formatResult(res, 400, false, "Invalid Token", null);
        } else if (err.message === "jwt expired") {
          formatResult(res, 400, false, "Token Expired", null);
        } else {
          formatResult(req, 400, false, "Invalid Signature", null);
        }
      }
    });
  } else {
    formatResult(res, 400, false, "Unauthorized", "Token Needed");
  }
};

const AuthReset = (req, res, next) => {
  const auth = req.query.token;
  if (auth) {
    jwt.verify(auth, process.env.SECRET_KEY_RESET, function (err, decoded) {
      if (!err) {
        req.email = decoded.email;
        next();
      } else {
        if (err.message === "jwt malformed") {
          formatResult(res, 400, false, "Invalid Token", null);
        } else if (err.message === "jwt expired") {
          formatResult(res, 400, false, "Token Expired", null);
        } else {
          formatResult(req, 400, false, "Invalid Signature", null);
        }
      }
    });
  } else {
    formatResult(res, 400, false, "Unauthorized", "Token Needed");
  }
};

const AuthVerify = (req, res, next) => {
  const auth = req.query.token;
  console.log(req.query);
  if (auth) {
    jwt.verify(auth, process.env.SECRET_KEY_CONFIRM, function (err, decoded) {
      if (!err) {
        req.body = decoded;
        next();
      } else {
        if (err.message === "jwt malformed") {
          formatResult(res, 400, false, "Invalid Token", null);
        } else if (err.message === "jwt expired") {
          formatResult(res, 400, false, "Token Expired", null);
        } else {
          formatResult(req, 400, false, "Invalid Signature", null);
        }
      }
    });
  } else {
    formatResult(res, 400, false, "Unauthorized", "Token Needed");
  }
};

module.exports = { Auth, AuthAdmin, AuthReset, AuthVerify };
