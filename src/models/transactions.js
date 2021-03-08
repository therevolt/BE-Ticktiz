const connection = require("../configs/configs");
require("dotenv").config(); // Import env Config

module.exports = {
  inputTrx: (body, userId) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "SELECT * FROM `transaction` WHERE user_id = ? AND ticket_id = ?",
        [userId, body.ticket_id],
        (error, resultz) => {
          if (resultz.length < 1) {
            connection.query(
              "INSERT INTO `transaction` (`total_price`, `user_id`, `created_at`, `updated_at`, `ticket_id`, `transaction_status`) VALUES (?, ?, current_timestamp(), ?, ?, ?)",
              [body.total_price, userId, new Date(), body.ticket_id, body.status],
              (err, result) => {
                if (!err) {
                  connection.query(
                    "SELECT * FROM `transaction` WHERE id = ?",
                    result.insertId,
                    (errs, results) => {
                      if (!errs) {
                        resolve(results);
                      }
                    }
                  );
                } else {
                  reject("userId or ticketId not found");
                }
              }
            );
          } else {
            reject("transaction already exists");
          }
        }
      );
    });
  },
  getAllTrx: (userId) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "SELECT * FROM `transaction` WHERE user_id = ? ORDER BY updated_at DESC",
        userId,
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
  getTrxByStatus: (userId, status) => {
    if (status) {
      return new Promise((resolve, reject) => {
        connection.query(
          "SELECT * FROM `transaction` WHERE transaction_status = ? AND user_id = ?",
          [status, userId],
          (err, result) => {
            if (!err) {
              resolve(result);
            } else {
              reject(err.message);
            }
          }
        );
      });
    }
  },
  editTrxById: (trxId, body) => {
    return new Promise((resolve, reject) => {
      connection.query("UPDATE `transaction` SET ? WHERE id = ?", [body, trxId], (err, result) => {
        if (!err) {
          if (result.affectedRows === 1) {
            connection.query("SELECT * FROM `transaction` WHERE id = ?", trxId, (errs, results) => {
              if (!err) {
                resolve(results);
              }
            });
          } else {
            reject("trxId not found");
          }
        } else {
          reject(err.message);
        }
      });
    });
  },
  deleteTrxById: (trxId) => {
    return new Promise((resolve, reject) => {
      connection.query("DELETE FROM `transaction` WHERE id = ?", trxId, (err, result) => {
        if (!err) {
          if (result.affectedRows === 1) {
            resolve(`success delete id ${trxId}`);
          } else {
            reject("trxId not found");
          }
        } else {
          reject(err.message);
        }
      });
    });
  },
};
