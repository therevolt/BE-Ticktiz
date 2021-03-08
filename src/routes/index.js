const express = require("express");
const Route = express.Router();
const users = require("./userRoutes");
const movies = require("./movieRoutes");
const trxs = require("./transactionRoutes");
const tickets = require("./ticketRoutes");

Route.use("/users", users);
Route.use("/movies", movies);
Route.use("/trx", trxs);
Route.use("/tickets", tickets);

module.exports = Route;
