const movieModels = require("../models/movies");
const formatResult = require("../helpers/formatResult");

module.exports = {
  inputMovie: (req, res) => {
    movieModels
      .inputMovies(req.body)
      .then((result) => {
        formatResult(res, 201, true, "success input 1 data", req.body);
      })
      .catch((err) => {
        formatResult(res, 400, false, err, null);
      });
  },
  getAllMovies: (req, res) => {
    movieModels
      .getAllMovies(req.query.page, req.query.limit)
      .then((result) => {
        formatResult(res, 200, true, "success", result);
      })
      .catch((err) => {
        formatResult(res, 404, false, null, err);
      });
  },
  editMovieDetails: (req, res) => {
    movieModels
      .editMovieDetails(req.body, req.params.movieId)
      .then((result) => {
        formatResult(res, 200, true, `${result.length} data has been updated`, result);
      })
      .catch((err) => {
        formatResult(res, 400, false, err, null);
      });
  },
  getMovieDetails: (req, res) => {
    movieModels.getMovieDetails(req.params.movieId).then((result) => {
      if (result.length > 0) {
        formatResult(res, 200, true, `${result.length} data found`, result);
      } else {
        formatResult(res, 400, false, `movieId not found`, null);
      }
    });
  },
  delMovie: (req, res) => {
    movieModels.delMovie(req.params.movieId).then((result) => {
      if (result.affectedRows === 1) {
        formatResult(res, 200, true, `success delete data id(${req.params.movieId})`, null);
      } else {
        formatResult(res, 400, false, `movieId not found`, null);
      }
    });
  },
};
