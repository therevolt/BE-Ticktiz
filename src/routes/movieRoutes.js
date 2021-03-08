const express = require("express");
const Route = express.Router();

const movieControllers = require("../controllers/movies");

Route.post("/", movieControllers.inputMovie)
  .get("/", movieControllers.getAllMovies)
  .get("/:movieId", movieControllers.getMovieDetails)
  .put("/:movieId", movieControllers.editMovieDetails)
  .delete("/:movieId", movieControllers.delMovie);

module.exports = Route;
