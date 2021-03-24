const express = require("express");
const Route = express.Router();
const users = require("./userRoutes");
const movies = require("./movieRoutes");
const trxs = require("./transactionRoutes");
const tickets = require("./ticketRoutes");
const cinemas = require("./cinemaRoutes");
const ordered = require("./orderedRoutes");
const token = require("./tokenRoutes");

Route.use("/users", users);
Route.use("/movies", movies);
Route.use("/trx", trxs);
Route.use("/tickets", tickets);
Route.use("/cinemas", cinemas);
Route.use("/order", ordered);
Route.use("/", token);

module.exports = Route;
