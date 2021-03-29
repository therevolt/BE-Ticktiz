const express = require("express");
const Route = express.Router();

const movieControllers = require("../controllers/movies");
const { AuthAdmin } = require("../middlewares/auth");
const middleUpload = require("../middlewares/upload");

// const { getAllMovie } = require("../middlewares/redis");

Route.post("/", AuthAdmin, middleUpload("image"), movieControllers.inputMovie)
  .get("/", movieControllers.getAllMovies)
  .get("/search", movieControllers.getMoviesByTitle)
  .get("/:movieId", movieControllers.getMovieDetails)
  .put("/:movieId", AuthAdmin, middleUpload("image"), movieControllers.editMovieDetails)
  .put("/showing/:movieId", AuthAdmin, movieControllers.setNowShowing)
  .delete("/:movieId", AuthAdmin, movieControllers.delMovie);

module.exports = Route;
