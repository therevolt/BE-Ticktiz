const express = require("express");
const Route = express.Router();
const userControllers = require("../controllers/users");
const { Auth, AuthAdmin, AuthReset } = require("../middlewares/auth");
const middleUpload = require("../middlewares/upload");

Route.post("/", middleUpload("avatar"), userControllers.inputUser)
  .get("/", Auth, userControllers.getUser)
  .put("/:userId", Auth, middleUpload("avatar"), userControllers.editUserByUserId)
  .get("/:userId", Auth, userControllers.getUser)
  .delete("/:userId", AuthAdmin, userControllers.deleteUserByUserId)
  .post("/login", userControllers.loginUser)
  .post("/reset", userControllers.resetPassword)
  .post("/confirmReset", AuthReset, userControllers.confirmResetPassword);

module.exports = Route;
