const connection = require("../configs/configs");
require("dotenv").config(); // Import env Config

module.exports = {
  inputTrx: (body) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "INSERT INTO `transactions` (`id`, `total_price`, `unique_code`, `user_id`, `status`, `playlist_id`, `created_at`, `updated_at`) VALUES (NULL, ?, NULL, ?, ?, ?, current_timestamp(), current_timestamp())",
        [body.total_price, body.user_id, body.status, body.playlist_id],
        (err, result) => {
          if (!err) {
            connection.query(
              "SELECT * FROM `transactions` WHERE id = ?",
              result.insertId,
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
  getTrx: (query, role) => {
    return new Promise((resolve, reject) => {
      if (query.user_id) {
        connection.query(
          "SELECT * FROM `transactions` WHERE user_id = ?",
          query.user_id,
          (err, result) => {
            if (!err) {
              resolve(result);
            } else {
              reject(err.message);
            }
          }
        );
      } else if (query.trx_id) {
        connection.query(
          "SELECT * FROM `transactions` WHERE id = ?",
          query.trx_id,
          (err, result) => {
            if (!err) {
              resolve(result);
            } else {
              reject(err.message);
            }
          }
        );
      } else if (query.playlist_id) {
        connection.query(
          "SELECT * FROM `transactions` WHERE playlist_id = ?",
          query.playlist_id,
          (err, result) => {
            if (!err) {
              resolve(result);
            } else {
              reject(err.message);
            }
          }
        );
      } else if (query.status) {
        connection.query(
          "SELECT * FROM `transactions` WHERE status = ?",
          query.status,
          (err, result) => {
            if (!err) {
              resolve(result);
            } else {
              reject(err.message);
            }
          }
        );
      } else {
        if (role === "admin") {
          connection.query("SELECT * FROM `transactions`", (err, result) => {
            if (!err) {
              resolve(result);
            } else {
              reject(err.message);
            }
          });
        } else {
          reject("Admin Only");
        }
      }
    });
  },
  editTrx: (body, id) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "UPDATE `transactions` SET ? WHERE `transactions`.`id` = ?",
        [body, id],
        (err) => {
          if (!err) {
            connection.query("SELECT * FROM `transactions` WHERE id = ?", id, (errs, results) => {
              if (!errs) {
                resolve(results);
              } else {
                reject(errs.message);
              }
            });
          } else {
            reject(err.message);
          }
        }
      );
    });
  },
  delMovie: (id) => {
    return new Promise((resolve, reject) => {
      connection.query("DELETE FROM `transactions` WHERE id = ?", id, (err) => {
        if (!err) {
          resolve("Success Delete Transaction");
        } else {
          reject(err.message);
        }
      });
    });
  },
};
