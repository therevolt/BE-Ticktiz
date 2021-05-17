const connection = require("../configs/configs");

module.exports = {
  getPlaylists: (movie_id) => {
    return new Promise((resolve, reject) => {
      connection.query("SELECT * FROM `playlists` WHERE movie_id=?", movie_id, (err, result) => {
        if (!err) {
          if (result.length >= 1) {
            const newResult = result.map((item) => {
              return {
                ...item,
                playing_time: `${new Date(item.playing_time).getFullYear()}-${
                  new Date(item.playing_time).getMonth().toString().length < 2
                    ? `0${new Date(item.playing_time).getMonth() + 1}`
                    : new Date(item.playing_time).getMonth() + 1
                }-${
                  new Date(item.playing_time).getDate().toString().length < 2
                    ? `0${new Date(item.playing_time).getDate()}`
                    : new Date(item.playing_time).getDate()
                }T${
                  new Date(item.playing_time).getHours().toString().length < 2
                    ? `0${new Date(item.playing_time).getHours()}`
                    : new Date(item.playing_time).getHours()
                }:${
                  new Date(item.playing_time).getMinutes().toString().length < 2
                    ? `0${new Date(item.playing_time).getMinutes()}`
                    : new Date(item.playing_time).getMinutes()
                }:${
                  new Date(item.playing_time).getSeconds().toString().length < 2
                    ? `0${new Date(item.playing_time).getSeconds()}`
                    : new Date(item.playing_time).getSeconds()
                }.000Z`,
              };
            });
            resolve(newResult);
          } else {
            reject("Not Found");
          }
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
        (err) => {
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
