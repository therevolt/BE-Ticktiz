const connection = require("../configs/configs");

module.exports = {
  inputTicket: (body) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "SELECT * FROM `ticket` WHERE movie_id = ? AND seat_count = ? AND seat_description = ?",
        [body.movie_id, body.seat_count, body.seat_description],
        (err, result) => {
          if (result.length < 1) {
            connection.query(
              "INSERT INTO `ticket` (`id`, `playing_time`, `movie_id`, `seat_count`, `seat_description`, `user_id`, `created_at`, `updated_at`) VALUES (NULL, ?, ?, ?, ?, ?, current_timestamp(), ?);",
              [
                body.playing_time,
                body.movie_id,
                body.seat_count,
                body.seat_description,
                body.user_id,
                new Date(),
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
            reject(`ticket already exists`);
          }
        }
      );
    });
  },
  getDetailTicketByUserId: (userId) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "SELECT ticket.id,movies.name,ticket.playing_time,movies.category,transaction.total_price,transaction.transaction_status,ticket.seat_count,ticket.seat_description FROM ((movies INNER JOIN ticket ON movies.id = (SELECT ticket.movie_id FROM ticket WHERE ticket.user_id = ? LIMIT 1)) INNER JOIN transaction ON ticket.id = transaction.ticket_id) ORDER BY ticket.playing_time DESC",
        [userId],
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
  getDetailTicketByMovieId: (userId, movieId) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "SELECT ticket.id,movies.name,ticket.playing_time,movies.category,transaction.total_price,transaction.transaction_status,ticket.seat_count,ticket.seat_description FROM ((movies INNER JOIN ticket ON movies.id = (SELECT ticket.movie_id FROM ticket WHERE ticket.user_id = ? AND ticket.movie_id = ? LIMIT 1)) INNER JOIN transaction ON ticket.id = transaction.ticket_id)",
        [userId, movieId],
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
  getTicketByFilmName: (name, userId) => {
    return new Promise((resolve, reject) => {
      if (name) {
        connection.query(
          "SELECT id FROM `movies` WHERE `name` LIKE ?",
          `${name}%`,
          (err, result) => {
            if (result.length > 0) {
              if (!err) {
                connection.query(
                  "SELECT ticket.id,movies.name,ticket.playing_time,movies.category,transaction.total_price,transaction.transaction_status,ticket.seat_count,ticket.seat_description FROM ((movies INNER JOIN ticket ON movies.id = (SELECT ticket.movie_id FROM ticket WHERE ticket.user_id = ? AND ticket.movie_id = ? LIMIT 1)) INNER JOIN transaction ON ticket.id = transaction.ticket_id)",
                  [userId, result[0].id],
                  (errs, results) => {
                    if (!errs) {
                      if (results.length > 0) {
                        resolve(results);
                      } else {
                        reject("ticket not found");
                      }
                    } else {
                      reject(err.message);
                    }
                  }
                );
              } else {
                reject(err.message);
              }
            } else {
              reject(`movie not found`);
            }
          }
        );
      }
    });
  },
  getTicketById: (ticketId) => {
    return new Promise((resolve, reject) => {
      connection.query("SELECT * FROM `ticket` WHERE `id` = ?", [ticketId], (err, result) => {
        if (!err) {
          resolve(result);
        } else {
          reject(err.message);
        }
      });
    });
  },
  updateTicketByUserId: (data, ticketId, userId) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "UPDATE `ticket` SET ? WHERE id = ? AND user_id = ?",
        [data, ticketId, userId],
        (err) => {
          if (!err) {
            connection.query(
              "UPDATE `ticket` SET `updated_at` = ? WHERE id = ? AND user_id = ?",
              [new Date(), ticketId, userId],
              (errs, results) => {
                if (!errs) {
                  resolve(results);
                } else {
                  reject(errs.message);
                }
              }
            );
          }
        }
      );
    });
  },
  deleteTicketByUserId: (ticketId, userId) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "DELETE FROM `ticket` WHERE id = ? AND user_id = ?",
        [ticketId, userId],
        (err, result) => {
          if (result) {
            resolve(result.affectedRows);
          }
        }
      );
    });
  },
};
