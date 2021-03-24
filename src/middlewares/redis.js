const redis = require("redis");
const formatResult = require("../helpers/formatResult");
const movieModels = require("../models/movies");
const client = redis.createClient({ port: 6379 });

module.exports = {
  client,
  getAllCinema: (req, res, next) => {
    client.get("cinema", (err, result) => {
      if (err || !result) {
        getCinemas().then((result) => {
          client.setex("cinema", 86400, JSON.stringify(result));
          formatResult(res, 200, true, "Success", result);
        });
      } else {
        formatResult(res, 200, true, "Success - redis", JSON.parse(result));
      }
      next();
    });
  },
  getAllMovie: (req, res, next) => {
    client.get("movies", (err, result) => {
      if (err || !result) {
        movieModels
          .getAllMovies(req.query.page, req.query.limit)
          .then((result) => {
            client.setex("movies", 86400, JSON.stringify(result));
          })
          .catch((err) => {
            if (req.query.page && req.query.limit) {
              formatResult(res, 422, false, "Page or limit exceeds the existing data", err);
            } else {
              formatResult(res, 500, false, "Internal Server Error", err);
            }
          });
      } else {
        formatResult(res, 200, true, "Syccess - redis", JSON.parse(result));
      }
      next();
    });
  },
  clearRedis: (key) => {
    client.del(key);
  },
};
