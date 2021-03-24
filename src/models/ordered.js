const connection = require("../configs/configs");
require("dotenv").config(); // Import env Config

module.exports = {
  inputOrder: (body) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "INSERT INTO `ordered_seat` (`id`, `playlist_id`, `transaction_id`, `cinema_id`, `seat_row`, `seat_col`, `created_at`, `updated_at`) VALUES (NULL, ?, ?, ?, ?, ?, current_timestamp(), current_timestamp())",
        [body.playlist_id, body.transaction_id, body.cinema_id, body.seat_row, body.seat_col],
        (err, result) => {
          if (!err) {
            connection.query(
              "SELECT * FROM `ordered_seat` WHERE id = ?",
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
  getDetails: (query, role) => {
    return new Promise((resolve, reject) => {
      if (query.order_id) {
        connection.query(
          "SELECT * FROM `ordered_seat` WHERE id = ?",
          query.order_id,
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
          "SELECT * FROM `ordered_seat` WHERE playlist_id = ?",
          query.playlist_id,
          (err, result) => {
            if (!err) {
              resolve(result);
            } else {
              reject(err.message);
            }
          }
        );
      } else if (query.transaction_id) {
        connection.query(
          "SELECT * FROM `ordered_seat` WHERE transaction_id = ?",
          query.transaction_id,
          (err, result) => {
            if (!err) {
              resolve(result);
            } else {
              reject(err.message);
            }
          }
        );
      } else if (query.cinema_id) {
        connection.query(
          "SELECT * FROM `ordered_seat` WHERE cinema_id = ?",
          query.cinema_id,
          (err, result) => {
            if (!err) {
              resolve(result);
            } else {
              reject(err.message);
            }
          }
        );
      } else if (query.seat_row && query.seat_col) {
        connection.query(
          "SELECT * FROM `ordered_seat` WHERE seat_row = ? AND seat_col = ?",
          [query.seat_row, query.seat_col],
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
          connection.query("SELECT * FROM `ordered_seat`", (err, result) => {
            if (!err) {
              resolve(result);
            } else {
              reject(err.message);
            }
          });
        }
      }
    });
  },
  updateDetailsOrder: (body, id) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "UPDATE `ordered_seat` SET ? WHERE `ordered_seat`.`id` = ?",
        [body, id],
        (err) => {
          if (!err) {
            connection.query("SELECT * FROM `ordered_seat` WHERE id = ?", id, (errs, results) => {
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
  deleteOrder: (id) => {
    return new Promise((resolve, reject) => {
      connection.query("DELETE FROM `ordered_seat` WHERE id = ?", id, (err) => {
        if (!err) {
          resolve("Success Delete Order History");
        } else {
          reject(err.message);
        }
      });
    });
  },
};
