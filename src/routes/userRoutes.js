const express = require("express");
const Route = express.Router();
const userControllers = require("../controllers/users");
const { Auth, AuthAdmin, AuthReset, AuthVerify } = require("../middlewares/auth");
const middleUpload = require("../middlewares/upload");

Route.post("/", middleUpload("avatar"), userControllers.inputUser)
  .get("/verify", AuthVerify, userControllers.verifyUser)
  .get("/", Auth, userControllers.getUser)
  .get("/profile", Auth, userControllers.getUserByToken)
  .put("/:userId", Auth, middleUpload("avatar"), userControllers.editUserByUserId)
  .get("/:userId", Auth, userControllers.getUser)
  .delete("/:userId", AuthAdmin, userControllers.deleteUserByUserId)
  .post("/login", userControllers.loginUser)
  .post("/reset", userControllers.resetPassword)
  .post("/confirmReset", AuthReset, userControllers.confirmResetPassword);

module.exports = Route;
