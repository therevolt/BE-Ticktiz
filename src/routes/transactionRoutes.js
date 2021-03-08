const express = require("express");
const Route = express.Router();

const trxControllers = require("../controllers/transactions");

Route.post("/:userId", trxControllers.inputUser)
  .get("/s/:userId", trxControllers.getAllTrx)
  .get("/:userId", trxControllers.getTrxByStatus)
  .put("/:trxId", trxControllers.editTrxById)
  .delete("/:trxId", trxControllers.deleteTrxById);

module.exports = Route;
