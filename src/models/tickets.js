const connection = require("../configs/configs");

module.exports = {
  inputTicket: (body) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "INSERT INTO `tickets` (`id`, `user_id`, `transactions_id`, `ordered_seat_id`, `created_at`, `updated_at`) VALUES (NULL, ?, ?, ?, current_timestamp(), current_timestamp())",
        [body.user_id, body.transactions_id, body.ordered_seat_id],
        (err, result) => {
          if (!err) {
            connection.query(
              "SELECT * FROM `tickets` WHERE id = ?",
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
  getTicket: (query, role) => {
    return new Promise((resolve, reject) => {
      if (query.user_id) {
        connection.query(
          "SELECT * FROM `tickets` WHERE user_id = ?",
          query.user_id,
          (err, result) => {
            if (!err) {
              resolve(result);
            } else {
              reject(err.message);
            }
          }
        );
      } else if (query.transactions_id) {
        connection.query(
          "SELECT * FROM `tickets` WHERE transactions_id = ?",
          query.transactions_id,
          (err, result) => {
            if (!err) {
              resolve(result);
            } else {
              reject(err.message);
            }
          }
        );
      } else if (query.ordered_seat_id) {
        connection.query(
          "SELECT * FROM `tickets` WHERE ordered_seat_id = ?",
          query.ordered_seat_id,
          (err, result) => {
            if (!err) {
              resolve(result);
            } else {
              reject(err.message);
            }
          }
        );
      } else if (query.ticket_id) {
        connection.query("SELECT * FROM `tickets` WHERE id = ?", query.ticket_id, (err, result) => {
          if (!err) {
            resolve(result);
          } else {
            reject(err.message);
          }
        });
      } else {
        if (role === "admin") {
          connection.query("SELECT * FROM `tickets`", (err, result) => {
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
  updateTicketByUserId: (data, ticketId) => {
    return new Promise((resolve, reject) => {
      connection.query("UPDATE `tickets` SET ? WHERE id = ?", [data, ticketId], (err) => {
        if (!err) {
          connection.query(
            "UPDATE `tickets` SET `updated_at` = ? WHERE id = ?",
            [new Date(), ticketId],
            (errs) => {
              if (!errs) {
                connection.query(
                  "SELECT * FROM `tickets` WHERE id = ?",
                  ticketId,
                  (err2, result2) => {
                    if (!err2) {
                      resolve(result2);
                    } else {
                      reject(err2.message);
                    }
                  }
                );
              } else {
                reject(errs.message);
              }
            }
          );
        }
      });
    });
  },
  deleteTicketByUserId: (ticketId) => {
    return new Promise((resolve, reject) => {
      connection.query("DELETE FROM `tickets` WHERE id = ?", [ticketId], (err) => {
        if (!err) {
          resolve(null);
        } else {
          reject(err.message);
        }
      });
    });
  },
};
