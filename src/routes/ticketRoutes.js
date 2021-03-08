const express = require("express");
const Route = express.Router();

const ticketControllers = require("../controllers/tickets");

Route.post("", ticketControllers.inputTicket)
  .get("/:userId", ticketControllers.getTicketByFilmName)
  .get("", ticketControllers.getTicketById)
  .get("/details/user/:userId", ticketControllers.getDetailTicketByUserId)
  .get("/details/movie/:userId", ticketControllers.getTicketByMovieId)
  .put("/:userId", ticketControllers.updateTicketByUserId)
  .delete("/:userId", ticketControllers.deleteTicketByUserId);

module.exports = Route;
