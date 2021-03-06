const movieModels = require("../models/movies");
const formatResult = require("../helpers/formatResult");
const { clearRedis } = require("../middlewares/redis");

module.exports = {
  inputMovie: (req, res) => {
    movieModels
      .inputMovies(req.body)
      .then((result) => {
        clearRedis("movies");
        formatResult(res, 201, true, "success input 1 data", { id: result.insertId, ...req.body });
      })
      .catch((err) => {
        formatResult(res, 404, false, err, null);
      });
  },
  getAllMovies: (req, res) => {
    movieModels
      .getAllMovies(req.query.page, req.query.limit)
      .then((result) => {
        formatResult(res, 200, true, "Success", result);
      })
      .catch((err) => {
        if (req.query.page && req.query.limit) {
          formatResult(res, 422, false, "Page or limit exceeds the existing data", err);
        } else {
          formatResult(res, 500, false, "Internal Server Error", err);
        }
      });
  },
  getMoviesByTitle: (req, res) => {
    movieModels
      .getMoviesByTitle(req.query.title)
      .then((result) => {
        formatResult(res, 200, true, "success", result);
      })
      .catch((err) => {
        formatResult(res, 404, false, err, null);
      });
  },
  editMovieDetails: (req, res) => {
    movieModels
      .editMovieDetails(req.body, req.params.movieId)
      .then((result) => {
        formatResult(res, 200, true, `${result.length} data has been updated`, result);
      })
      .catch((err) => {
        formatResult(res, 404, false, err, null);
      });
  },
  getMovieDetails: (req, res) => {
    movieModels
      .getMovieDetails(req.params.movieId)
      .then((result) => {
        if (result.length > 0) {
          if (result.length === 1) {
            formatResult(res, 200, true, `${result.length} data found`, result);
          } else {
            formatResult(res, 200, true, `${result.length} data found`, result);
          }
        } else {
          formatResult(res, 404, false, "movieId not found", null);
        }
      })
      .catch((err) => {
        formatResult(res, 500, false, err, null);
      });
  },
  delMovie: (req, res) => {
    movieModels
      .delMovie(req.params.movieId)
      .then((result) => {
        if (result.affectedRows === 1) {
          formatResult(res, 200, true, `success delete data id(${req.params.movieId})`, null);
        } else {
          formatResult(res, 404, false, "movieId not found", null);
        }
      })
      .catch((err) => {
        formatResult(res, 500, false, err, null);
      });
  },
  setNowShowing: (req, res) => {
    movieModels
      .setNowShowing(req.params.movieId)
      .then((result) => {
        formatResult(res, 200, true, "Success Set Now Showing Movie", result);
      })
      .catch((err) => {
        formatResult(res, 500, false, err, null);
      });
  },
};
