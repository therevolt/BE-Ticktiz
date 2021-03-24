const express = require("express");
const ordered = require("../controllers/ordered");
const { Auth, AuthAdmin } = require("../middlewares/auth");
const Route = express.Router();

Route.post("/", Auth, ordered.inputOrder)
  .get("/", Auth, ordered.getDetailsOrder)
  .put("/:id", AuthAdmin, ordered.updateDetailsOrder)
  .delete("/:id", AuthAdmin, ordered.deleteOrder);

module.exports = Route;
