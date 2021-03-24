const connection = require("../configs/configs");

module.exports = {
  getPlaylists: (movie_id) => {
    return new Promise((resolve, reject) => {
      connection.query("SELECT * FROM `playlists` WHERE movie_id=?", movie_id, (err, result) => {
        if (!err) {
          resolve(result);
        } else {
          reject(err.message);
        }
      });
    });
  },
  insertPlaylists: (body) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "INSERT INTO `playlists` (`id`, `movie_id`, `cinema_id`, `playing_time`, `price`, `created_at`, `updated_at`) VALUES (NULL, ?, ?, ?, ?, current_timestamp(), current_timestamp())",
        [body.movie_id, body.cinema_id, body.playing_time, body.price],
        (err, result) => {
          if (!err) {
            resolve("Success Input");
          } else {
            reject(err.message);
          }
        }
      );
    });
  },
  editPlaylists: (body, playlists_id) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "UPDATE `playlists` SET ? WHERE `playlists`.`id` = ?",
        [body, playlists_id],
        (err) => {
          if (!err) {
            connection.query(
              "SELECT * FROM `playlists` WHERE id = ?",
              playlists_id,
              (errs, results) => {
                if (!errs) {
                  resolve(results);
                } else {
                  reject(errs.message);
                }
              }
            );
          } else {
            reject(err.message);
          }
        }
      );
    });
  },
  deletePlaylists: (playlists_id) => {
    return new Promise((resolve, reject) => {
      connection.query("SELECT * FROM `playlists` WHERE id = ?", playlists_id, (err) => {
        if (!err) {
          connection.query("DELETE FROM `users` WHERE id = ?", playlists_id, (errs) => {
            if (!errs) {
              resolve(`Success Delete (${playlists_id})`);
            } else {
              reject(errs.message);
            }
          });
        } else {
          reject(err.message);
        }
      });
    });
  },
};
