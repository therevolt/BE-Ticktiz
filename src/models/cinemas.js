const connection = require("../configs/configs");

module.exports = {
  getCinemas: () => {
    return new Promise((resolve, reject) => {
      connection.query("SELECT * FROM `cinemas`", (err, result) => {
        if (!err) {
          resolve(result);
        }
      });
    });
  },
  getCinemasById: (id) => {
    return new Promise((resolve, reject) => {
      connection.query("SELECT * FROM `cinemas` WHERE id = ?", id, (err, result) => {
        if (!err) {
          resolve(result);
        }
      });
    });
  },
  inputCinemas: (body) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "INSERT INTO `cinemas` (`id`, `name`, `logo`, `address`, `created_at`, `updated_at`) VALUES (NULL, ?, ?, ?, current_timestamp(), current_timestamp())",
        [body.name, body.logo, body.address],
        (err, result) => {
          if (!err) {
            connection.query(
              "SELECT * FROM `cinemas` WHERE name = ?",
              body.name,
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
  editCinemas: (body, id) => {
    return new Promise((resolve, reject) => {
      connection.query("UPDATE `cinemas` SET ? WHERE `cinemas`.`id` = ?", [body, id], (err) => {
        if (!err) {
          connection.query("SELECT * FROM `cinemas` WHERE id = ?", id, (errs, results) => {
            if (!errs) {
              resolve(results);
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
  deleteCinemas: (id) => {
    return new Promise((resolve, reject) => {
      connection.query("SELECT * FROM `cinemas` WHERE id = ?", id, (err) => {
        if (!err) {
          connection.query("DELETE FROM `users` WHERE id = ?", id, (errs) => {
            if (!errs) {
              resolve(`Success Delete (${id})`);
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
