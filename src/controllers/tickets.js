const ticketModels = require("../models/tickets");
const formatResult = require("../helpers/formatResult");
let jwt = require("jsonwebtoken");
const convertMonth = require("../helpers/convertMonth");
const format2Digit = require("../helpers/formatTime");

module.exports = {
  inputTicket: (req, res) => {
    ticketModels
      .inputTicket(req.body)
      .then((result) => {
        formatResult(res, 201, true, "success input", result);
      })
      .catch((err) => {
        if (err === "ticket already exists") {
          formatResult(res, 409, false, err, null);
        } else {
          formatResult(res, 406, false, "user_id not registered", null);
        }
      });
  },
  getTicket: (req, res) => {
    jwt.verify(
      req.headers["authorization"].split(" ")[1],
      process.env.SECRET_KEY,
      (err, result) => {
        if (!err) {
          ticketModels
            .getTicket(req.query, req.role, result.id)
            .then((result) => {
              formatResult(res, 200, true, "Success", result);
            })
            .catch((err) => {
              formatResult(res, 500, false, err, null);
            });
        }
      }
    );
  },
  getDetailTicket: (req, res) => {
    ticketModels
      .getDetailsTicket(req.query.trxId)
      .then((result) => {
        const dataResult = {
          movie: result[0].name,
          date: `${new Date(result[0].playing_time).getDate()} ${convertMonth(
            new Date(result[0].playing_time).getMonth(),
            "short"
          )}`,
          time: `${format2Digit(new Date(result[0].playing_time).getHours())}:${format2Digit(
            new Date(result[0].playing_time).getMinutes()
          )}`,
          category: result[0].category,
          count: result.length,
          seats: result.map((item) => item.seat).join(", "),
          price: result[0].total_price,
        };
        formatResult(res, 200, true, "Success Get Detail Ticket", dataResult);
      })
      .catch((err) => {
        formatResult(res, 400, false, err, null);
      });
  },
  getTicketByTrxID: (req, res) => {
    ticketModels
      .getTicketByTrxID(req.body.transactions_id)
      .then((result) => {
        const dataResult = [
          {
            total_price: result[0].total_price,
            playlist_id: result[0].playlist_id,
            movie_id: result[0].movie_id,
            cinema_id: result[0].cinema_id,
            name: result[0].name,
            playing_time: `${new Date(result[0].playing_time).getFullYear()}-${
              new Date(result[0].playing_time).getMonth().toString().length < 2
                ? `0${new Date(result[0].playing_time).getMonth() + 1}`
                : new Date(result[0].playing_time).getMonth() + 1
            }-${
              new Date(result[0].playing_time).getDate().toString().length < 2
                ? `0${new Date(result[0].playing_time).getDate()}`
                : new Date(result[0].playing_time).getDate()
            }T${
              new Date(result[0].playing_time).getHours().toString().length < 2
                ? `0${new Date(result[0].playing_time).getHours()}`
                : new Date(result[0].playing_time).getHours()
            }:${
              new Date(result[0].playing_time).getMinutes().toString().length < 2
                ? `0${new Date(result[0].playing_time).getMinutes()}`
                : new Date(result[0].playing_time).getMinutes()
            }:${
              new Date(result[0].playing_time).getSeconds().toString().length < 2
                ? `0${new Date(result[0].playing_time).getSeconds()}`
                : new Date(result[0].playing_time).getSeconds()
            }.000Z`,
            category: result[0].category,
            seat: result.map((item) => item.seat),
          },
        ];
        formatResult(res, 200, true, "Success Get Ticket", dataResult);
      })
      .catch((err) => {
        formatResult(res, 400, false, err, null);
      });
  },
  updateTicketByUserId: (req, res) => {
    ticketModels
      .updateTicketByUserId(req.body, req.params.id)
      .then((result) => {
        formatResult(res, 200, true, "Success Update Details Ticket", result);
      })
      .catch((err) => {
        formatResult(res, 500, false, err, null);
      });
  },
  deleteTicketByUserId: (req, res) => {
    ticketModels
      .deleteTicketByUserId(req.params.id)
      .then(() => {
        formatResult(res, 200, true, "Success Delete Ticket", null);
      })
      .catch((err) => {
        formatResult(res, 400, false, err, null);
      });
  },
};
