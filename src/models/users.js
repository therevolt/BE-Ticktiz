const connection = require("../configs/configs");
const bcrypt = require("bcrypt");
const { v4: uuidv4 } = require("uuid");

module.exports = {
  inputUser: (body) => {
    return new Promise((resolve, reject) => {
      connection.query("SELECT * FROM `users` WHERE `email` = ?", body.email, (err, result) => {
        if (!err) {
          if (result.length === 0) {
            bcrypt.hash(body.password, 10, function (error, hash) {
              if (!error) {
                connection.query(
                  "INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `created_at`, `updated_at`) VALUES (?, ?, ?, ?, ?, current_timestamp(), current_timestamp());",
                  [uuidv4(), body.first_name, body.last_name, body.email, hash],
                  (errs) => {
                    if (!errs) {
                      connection.query(
                        "SELECT * FROM `users` WHERE email = ?",
                        body.email,
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
              } else {
                reject(error.message);
              }
            });
          } else if (result.length) {
            reject("email already registered");
          }
        } else {
          reject("bad request from data post");
        }
      });
    });
  },
  loginUser: (email, pass) => {
    return new Promise((resolve, reject) => {
      if (email && pass) {
        connection.query("SELECT * FROM `users` WHERE email = ?", email, (err, result) => {
          if (!err) {
            if (result.length > 0) {
              bcrypt.compare(pass, result[0].password, function (errCompare, resultCompare) {
                if (!errCompare) {
                  if (resultCompare) {
                    resolve(result);
                  } else {
                    reject("Password Incorrect");
                  }
                }
              });
            } else {
              reject("Email Incorrect");
            }
          }
        });
      }
    });
  },
  getUser: (numPage, limit, userId) => {
    if (!numPage && !limit) {
      if (userId) {
        return new Promise((resolve, reject) => {
          connection.query("SELECT * FROM `users` WHERE id = ?", [userId], (err, result) => {
            if (!err) {
              resolve(result);
            } else {
              reject(err.message);
            }
          });
        });
      } else {
        return new Promise((resolve, reject) => {
          connection.query("SELECT * FROM `users`", (err, result) => {
            if (!err) {
              resolve(result);
            } else {
              reject(err.message);
            }
          });
        });
      }
    } else {
      return new Promise((resolve, reject) => {
        connection.query("SELECT * FROM `users`", (err, result) => {
          if (!err) {
            const pages = Math.ceil(parseInt(result.length) / parseInt(limit));
            const query = `SELECT * FROM user LIMIT ${numPage - 1},${limit}`;
            connection.query(query, (errs, results) => {
              if (parseInt(numPage) < pages) {
                if (parseInt(numPage) === 1) {
                  resolve({
                    current_page: parseInt(numPage),
                    obj_limit: parseInt(limit),
                    obj_count: results.length,
                    max_page: pages,
                    url_next_page: `${process.env.HOST}:${process.env.PORT}/v1/users?page=${
                      parseInt(numPage) + 1
                    }&limit=${limit}`,
                    url_prev_page: null,
                    result: results,
                  });
                } else {
                  resolve({
                    current_page: parseInt(numPage),
                    obj_limit: parseInt(limit),
                    obj_count: results.length,
                    max_page: pages,
                    url_next_page: `${process.env.HOST}:${process.env.PORT}/v1/users?page=${
                      parseInt(numPage) + 1
                    }&limit=${limit}`,
                    url_prev_page: `${process.env.HOST}:${process.env.PORT}/v1/users?page=${
                      parseInt(numPage) - 1
                    }&limit=${limit}`,
                    result: results,
                  });
                }
              } else if (parseInt(numPage) >= pages) {
                if (results.length === 0) {
                  reject(null);
                } else {
                  resolve({
                    current_page: parseInt(numPage),
                    obj_limit: parseInt(limit),
                    obj_count: results.length,
                    max_page: pages,
                    url_next_page: null,
                    url_prev_page: null,
                    result: results,
                  });
                }
              } else {
                resolve({
                  current_page: parseInt(numPage),
                  obj_limit: parseInt(limit),
                  obj_count: results.length,
                  max_page: pages,
                  url_next_page: null,
                  url_prev_page: `${process.env.HOST}:${process.env.PORT}/v1/users?page=${
                    parseInt(numPage) - 1
                  }&limit=${limit}`,
                  result: results,
                });
              }
            });
          } else {
            reject(err.message);
          }
        });
      });
    }
  },
  editUserByUserId: (body, userId) => {
    return new Promise((resolve, reject) => {
      if (body.password) {
        bcrypt.hash(body.password, 10, function (error, hash) {
          if (!error) {
            body.password = hash;
            connection.query(
              "UPDATE `users` SET ? WHERE `users`.`id` = ?",
              [body, userId],
              (err) => {
                if (!err) {
                  connection.query(
                    "UPDATE `users` SET updated_at = ? WHERE `users`.`id` = ?",
                    [new Date(), userId],
                    (errs) => {
                      if (!errs) {
                        connection.query(
                          "SELECT * FROM `users` WHERE id = ?",
                          userId,
                          (error, result) => {
                            if (!error) {
                              resolve(result);
                            }
                          }
                        );
                      }
                    }
                  );
                } else {
                  reject(err.message);
                }
              }
            );
          } else {
            reject(error.message);
          }
        });
      } else {
        connection.query("UPDATE `users` SET ? WHERE `users`.`id` = ?", [body, userId], (err) => {
          if (!err) {
            connection.query(
              "UPDATE `users` SET updated_at = ? WHERE `users`.`id` = ?",
              [new Date(), userId],
              (errs) => {
                if (!errs) {
                  connection.query(
                    "SELECT * FROM `users` WHERE id = ?",
                    userId,
                    (error, result) => {
                      if (!error) {
                        resolve(result);
                      }
                    }
                  );
                }
              }
            );
          } else {
            reject(err.message);
          }
        });
      }
    });
  },
  deleteUserByUserId: (userId) => {
    return new Promise((resolve, reject) => {
      connection.query("SELECT * FROM `users` WHERE id = ?", userId, (err, result) => {
        if (!err && result.length > 0) {
          connection.query("DELETE FROM `users` WHERE id = ?", userId, (errs) => {
            if (!errs) {
              resolve(null);
            } else {
              connection.query("DELETE FROM `transaction` WHERE user_id = ?", userId, (error) => {
                if (!error) {
                  connection.query("DELETE FROM `ticket` WHERE user_id = ?", userId, (err2) => {
                    if (!err2) {
                      connection.query("DELETE FROM `users` WHERE id = ?", userId, (errs2) => {
                        if (!errs2) {
                          resolve(null);
                        } else {
                          reject("error endpoint");
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
  resetPassword: (body) => {
    return new Promise((resolve, reject) => {
      connection.query("SELECT * FROM `users` WHERE email = ?", body.email, (err, result) => {
        if (!err && result.length > 0) {
          resolve(result);
        } else {
          reject("Email Not Found");
        }
      });
    });
  },
  confirmResetPassword: (body, email) => {
    return new Promise((resolve, reject) => {
      bcrypt.hash(body.password, 10, function (error, hash) {
        if (!error) {
          body.password = hash;
          connection.query(
            "UPDATE `users` SET ? WHERE `users`.`email` = ?",
            [body, email],
            (err) => {
              if (!err) {
                connection.query(
                  "UPDATE `users` SET updated_at = ? WHERE `users`.`email` = ?",
                  [new Date(), email],
                  (errs) => {
                    if (!errs) {
                      connection.query(
                        "SELECT * FROM `users` WHERE email = ?",
                        email,
                        (error, result) => {
                          if (!error) {
                            resolve(result);
                          }
                        }
                      );
                    }
                  }
                );
              } else {
                reject(err.message);
              }
            }
          );
        } else {
          reject(error.message);
        }
      });
    });
  },
  verifyUser: (body) => {
    return new Promise((resolve, reject) => {
      connection.query("SELECT * FROM `users` WHERE email = ?", body.email, (err, result) => {
        if (!err && result.length > 0) {
          connection.query(
            "UPDATE `users` SET `active` = '1' WHERE email = ?",
            body.email,
            (err2) => {
              if (!err2) {
                connection.query(
                  "SELECT * FROM `users` WHERE email = ?",
                  body.email,
                  (err3, result3) => {
                    if (!err3) {
                      resolve(result3);
                    } else {
                      reject(err3.message);
                    }
                  }
                );
              } else {
                reject(err2.message);
              }
            }
          );
        } else {
          reject("Email Not Found");
        }
      });
    });
  },
};
