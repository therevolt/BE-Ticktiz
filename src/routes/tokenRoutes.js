const express = require("express");
const formatResult = require("../helpers/formatResult");
const jwt = require("jsonwebtoken");
const Route = express.Router();

Route.post("/token", (req, res) => {
  const postData = req.body;
  if (postData.refreshToken) {
    try {
      const data = jwt.verify(postData.refreshToken, process.env.SECRET_KEY_REFRESH);
      delete data.iat;
      delete data.exp;
      const token = jwt.sign(data, process.env.SECRET_KEY_REFRESH, { expiresIn: "3d" });
      const refreshToken = jwt.sign(data, process.env.SECRET_KEY_REFRESH, { expiresIn: "30d" });
      formatResult(res, 200, true, "Success Get New Token", [{ token, refreshToken }]);
    } catch (error) {
      formatResult(res, 400, false, "Refresh Token Not Valid", null);
    }
  } else {
    res.status(404).send("Invalid request");
  }
});

module.exports = Route;
