const express = require("express");
const Route = express.Router();

const movieControllers = require("../controllers/movies");
const { AuthAdmin } = require("../middlewares/auth");
const middleUpload = require("../middlewares/upload");

// const { getAllMovie } = require("../middlewares/redis");

Route.post("/", AuthAdmin, movieControllers.inputMovie)
  .get("/", movieControllers.getAllMovies)
  .get("/search", movieControllers.getMoviesByTitle)
  .get("/:movieId", movieControllers.getMovieDetails)
  .put("/:movieId", AuthAdmin, middleUpload("image"), movieControllers.editMovieDetails)
  .delete("/:movieId", AuthAdmin, movieControllers.delMovie);

module.exports = Route;
