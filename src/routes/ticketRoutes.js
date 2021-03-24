const express = require("express");
const Route = express.Router();

const ticketControllers = require("../controllers/tickets");
const { Auth, AuthAdmin } = require("../middlewares/auth");

Route.post("/", Auth, ticketControllers.inputTicket)
  .get("/", Auth, ticketControllers.getTicket)
  .put("/:id", AuthAdmin, ticketControllers.updateTicketByUserId)
  .delete("/:id", AuthAdmin, ticketControllers.deleteTicketByUserId);

module.exports = Route;
