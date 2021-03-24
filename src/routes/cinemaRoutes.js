const express = require("express");
const Route = express.Router();

const cinemaRoute = require("../controllers/cinemas");
const playlists = require("../controllers/playlists");
const { AuthAdmin } = require("../middlewares/auth");
const { getAllCinema } = require("../middlewares/redis");

Route.get("/", getAllCinema, cinemaRoute.getCinemas);
Route.post("/", AuthAdmin, cinemaRoute.inputCinemas);
Route.get("/:id", cinemaRoute.getCinemasById);
Route.put("/:id", AuthAdmin, cinemaRoute.editCinemas);
Route.delete("/:id", AuthAdmin, cinemaRoute.deleteCinemas);
Route.get("/playlist/:movie", playlists.getPlaylists);
Route.post("/playlist", AuthAdmin, playlists.insertPlaylists);
Route.put("/playlist/:playlists_id", AuthAdmin, playlists.editPlaylists);
Route.delete("/playlist/:playlists_id", AuthAdmin, playlists.deletePlaylists);
module.exports = Route;
