const connection = require("../configs/configs");

module.exports = {
  inputUser: (body) => {
    return new Promise((resolve, reject) => {
      connection.query("SELECT * FROM `user` WHERE `email` = ?", body.email, (err, result) => {
        if (!err) {
          if (result.length === 0) {
            connection.query(
              "INSERT INTO `user` (`first_name`, `last_name`, `email`, `password`, `updated_at`) VALUES (?,?,?,?,?)",
              [body.first_name, body.last_name, body.email, body.password, new Date()],
              (err, result) => {
                if (!err) {
                  resolve(result);
                } else {
                  reject(err.message);
                }
              }
            );
          } else if (result.length) {
            reject("email already registered");
          }
        } else {
          reject("bad request from data post");
        }
      });
    });
  },
  getUserByUserId: (userId) => {
    return new Promise((resolve, reject) => {
      connection.query("SELECT * FROM `user` WHERE id = ?", userId, (err, result) => {
        if (!err) {
          resolve(result);
        } else {
          reject(err.message);
        }
      });
    });
  },
  editUserByUserId: (body, userId) => {
    return new Promise((resolve, reject) => {
      connection.query("UPDATE `user` SET ? WHERE `user`.`id` = ?;", [body, userId], (err) => {
        if (!err) {
          connection.query(
            "UPDATE `user` SET updated_at = ? WHERE `user`.`id` = ?",
            [new Date(), userId],
            (errs) => {
              if (!errs) {
                connection.query("SELECT * FROM `user` WHERE id = ?", userId, (error, result) => {
                  if (!error) {
                    resolve(result);
                  }
                });
              }
            }
          );
        } else {
          reject(err.message);
        }
      });
    });
  },
  deleteUserByUserId: (userId) => {
    return new Promise((resolve, reject) => {
      connection.query("SELECT * FROM `user` WHERE id = ?", userId, (err, result) => {
        if (!err && result.length > 0) {
          connection.query("DELETE FROM `user` WHERE id = ?", userId, (errs) => {
            if (!errs) {
              resolve(null);
            } else {
              connection.query("DELETE FROM `transaction` WHERE user_id = ?", userId, (error) => {
                if (!error) {
                  connection.query("DELETE FROM `ticket` WHERE user_id = ?", userId, (err2) => {
                    if (!err2) {
                      connection.query("DELETE FROM `user` WHERE id = ?", userId, (errs2) => {
                        if (!errs2) {
                          resolve(null);
                        } else {
                          reject(`error endpoint`);
                        }
                      });
                    }
                  });
                }
              });
            }
          });
        } else {
          reject("user not found");
        }
      });
    });
  },
};
