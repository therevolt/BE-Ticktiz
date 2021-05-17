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
  getTicket: (query, role, id) => {
    return new Promise((resolve, reject) => {
      if (id) {
        connection.query(
          "SELECT tickets.transactions_id AS id, playlists.playing_time, tickets.status, cinemas.logo AS cinemas, movies.name AS movies, tickets.created_at AS order_time FROM tickets INNER JOIN ordered_seat ON tickets.ordered_seat_id = ordered_seat.id INNER JOIN cinemas ON ordered_seat.cinema_id = cinemas.id INNER JOIN playlists ON ordered_seat.playlist_id = playlists.id INNER JOIN movies ON playlists.movie_id WHERE tickets.user_id = ? AND playlists.movie_id = movies.id GROUP BY tickets.created_at",
          id,
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
              console.log(result);
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
  getTicketByTrxID: (trxId) => {
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT transactions.total_price, transactions.playlist_id, playlists.movie_id, playlists.cinema_id, playlists.playing_time, movies.name, movies.category, CONCAT(ordered_seat.seat_row,ordered_seat.seat_col) AS seat FROM tickets JOIN transactions ON tickets.transactions_id = transactions.id JOIN playlists ON playlists.id = transactions.playlist_id JOIN movies ON movies.id = playlists.movie_id JOIN ordered_seat ON ordered_seat.transaction_id = transactions.id WHERE transactions.id = ${trxId} GROUP BY seat`,
        (err, result) => {
          if (!err) {
            resolve(result);
          } else {
            reject(err.message);
          }
        }
      );
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
  getDetailsTicket: (trxId) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "SELECT movies.name, playlists.playing_time,movies.category,concat(ordered_seat.seat_row,ordered_seat.seat_col) AS seat, transactions.total_price AS total_price FROM `tickets` INNER JOIN `transactions` INNER JOIN `playlists` INNER JOIN `movies` INNER JOIN `ordered_seat` WHERE transactions.id=? AND transactions.playlist_id=playlists.id AND playlists.movie_id=movies.id AND ordered_seat.transaction_id=transactions.id GROUP BY concat(ordered_seat.seat_row,ordered_seat.seat_col)",
        [trxId],
        (err, result) => {
          if (!err) {
            resolve(result);
          } else {
            console.log(err.message);
            reject(err.message);
          }
        }
      );
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
