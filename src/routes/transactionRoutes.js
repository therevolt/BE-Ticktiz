const express = require("express");
const Route = express.Router();

const trxControllers = require("../controllers/transactions");
const { Auth, AuthAdmin } = require("../middlewares/auth");

Route.post("/", Auth, trxControllers.inputTrx)
  .get("/", Auth, trxControllers.getTrx)
  .put("/:id", AuthAdmin, trxControllers.editTrx)
  .delete("/:id", AuthAdmin, trxControllers.deleteTrx);

module.exports = Route;
