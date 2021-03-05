const connection = require("../configs/configs");

module.exports = {
  inputUser: (body) => {
    return new Promise((resolve, reject) => {
      connection.query("SELECT * FROM `user` WHERE `email` = ?", body.email, (err, result) => {
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
        } else {
          reject("email already registered");
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
        }
      });
    });
  },
};
