const express = require("express");
const Route = express.Router();

const userControllers = require("../controllers/users");

Route.post("/", userControllers.inputUser)
  .get("/:userId", userControllers.getUser)
  .get("/", userControllers.getUser)
  .put("/:userId", userControllers.editUserByUserId)
  .delete("/:userId", userControllers.deleteUserByUserId);

module.exports = Route;
