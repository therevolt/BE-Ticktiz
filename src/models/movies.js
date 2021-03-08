const connection = require("../configs/configs");
require("dotenv").config(); // Import env Config

module.exports = {
  inputMovies: (body) => {
    return new Promise((resolve, reject) => {
      connection.query("SELECT * FROM `movies` WHERE name = ?", body.name, (err, result) => {
        if (!err) {
          if (result.length <= 0) {
            connection.query(
              "INSERT INTO `movies` (`id`, `name`, `image`, `description`, `rating`, `duration`, `release_date`, `director`, `genre`, `casts`, `category`, `updated_at`) VALUES ('', ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, current_timestamp())",
              [
                body.name,
                body.image,
                body.description,
                body.rating,
                body.duration,
                body.release_date,
                body.director,
                body.genre,
                body.casts,
                body.category,
              ],
              (errs, results) => {
                if (!errs) {
                  resolve(results);
                } else {
                  reject(errs.message);
                }
              }
            );
          } else {
            reject("movies already exists");
          }
        }
      });
    });
  },
  getAllMovies: (numPage, limit) => {
    if (numPage === undefined || limit === undefined) {
      return new Promise((resolve, reject) => {
        connection.query("SELECT * FROM `movies`", (err, result) => {
          if (!err) {
            resolve(result);
          } else {
            reject(err.message);
          }
        });
      });
    } else {
      return new Promise((resolve, reject) => {
        connection.query("SELECT * FROM `movies`", (err, result) => {
          if (!err) {
            const pages = Math.ceil(parseInt(result.length) / parseInt(limit));
            const query = "SELECT * FROM `movies` LIMIT " + `${numPage - 1},${limit}`;
            connection.query(query, (errs, results) => {
              if (parseInt(numPage) < pages) {
                if (parseInt(numPage) === 1) {
                  resolve({
                    current_page: parseInt(numPage),
                    obj_limit: parseInt(limit),
                    max_page: pages,
                    url_next_page: `${process.env.HOST}:${process.env.PORT}/v1/movies?page=${
                      parseInt(numPage) + 1
                    }&limit=${limit}`,
                    url_prev_page: null,
                    result: results,
                  });
                } else {
                  resolve({
                    current_page: parseInt(numPage),
                    obj_limit: parseInt(limit),
                    max_page: pages,
                    url_next_page: `${process.env.HOST}:${process.env.PORT}/v1/movies?page=${
                      parseInt(numPage) + 1
                    }&limit=${limit}`,
                    url_prev_page: `${process.env.HOST}:${process.env.PORT}/v1/movies?page=${
                      parseInt(numPage) - 1
                    }&limit=${limit}`,
                    result: results,
                  });
                }
              } else if (parseInt(numPage) >= pages) {
                if (results.length === 0) {
                  reject(null);
                } else {
                  resolve({
                    current_page: parseInt(numPage),
                    obj_limit: parseInt(limit),
                    obj_count: results.length,
                    max_page: pages,
                    url_next_page: null,
                    url_prev_page: null,
                    result: results,
                  });
                }
              } else {
                resolve({
                  current_page: parseInt(numPage),
                  obj_limit: parseInt(limit),
                  max_page: pages,
                  url_next_page: null,
                  url_prev_page: `${process.env.HOST}:${process.env.PORT}/v1/movies?page=${
                    parseInt(numPage) - 1
                  }&limit=${limit}`,
                  result: results,
                });
              }
            });
          } else {
            reject(err.message);
          }
        });
      });
    }
  },
  editMovieDetails: (body, movieId) => {
    return new Promise((resolve, reject) => {
      connection.query("UPDATE `movies` SET ? WHERE id = ? ", [body, movieId], (err, result) => {
        if (!err) {
          if (result.affectedRows === 1) {
            connection.query("SELECT * FROM `movies` WHERE id = ?", movieId, (errs, results) => {
              resolve(results);
            });
          } else {
            reject("movieId not found");
          }
        } else {
          reject(err.message);
        }
      });
    });
  },
  getMovieDetails: (movieId) => {
    return new Promise((resolve, reject) => {
      connection.query("SELECT * FROM `movies` WHERE id = ?", [movieId], (err, result) => {
        if (!err) {
          resolve(result);
        } else {
          reject(err.message);
        }
      });
    });
  },
  delMovie: (movieId) => {
    return new Promise((resolve, reject) => {
      connection.query("DELETE FROM `movies` WHERE id = ?", [movieId], (err, result) => {
        if (!err) {
          resolve(result);
        } else {
          reject(err.message);
        }
      });
    });
  },
};
