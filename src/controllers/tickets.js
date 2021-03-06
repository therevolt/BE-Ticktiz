const ticketModels = require("../models/tickets");
const formatResult = require("../helpers/formatResult");

module.exports = {
  inputTicket: (req, res) => {
    ticketModels
      .inputTicket(req.body)
      .then((result) => {
        formatResult(res, 201, true, `success input ${result.affectedRows} data`, req.body);
      })
      .catch((err) => {
        formatResult(res, 400, false, err, null);
      });
  },
  getDetailTicketByUserId: (req, res) => {
    ticketModels
      .getDetailTicketByUserId(req.params.userId)
      .then((result) => {
        if (result.length > 0) {
          formatResult(res, 200, true, `${result.length} data found`, result);
        } else {
          formatResult(res, 404, false, "data not found", null);
        }
      })
      .catch((err) => {
        formatResult(res, 400, false, err, null);
      });
  },
  getTicketByFilmName: (req, res) => {
    ticketModels
      .getTicketByFilmName(req.query.name, req.params.userId)
      .then((result) => {
        formatResult(res, 200, true, "success", result);
      })
      .catch((err) => {
        formatResult(res, 404, false, err, null);
      });
  },
  getTicketByMovieId: (req, res) => {
    ticketModels
      .getDetailTicketByMovieId(req.params.userId, req.query.movieId)
      .then((result) => {
        if (result.length > 0) {
          formatResult(res, 200, true, "success", result);
        } else {
          formatResult(res, 404, false, "ticket not found", null);
        }
      })
      .catch((err) => {
        formatResult(res, 400, false, err, null);
      });
  },
  getTicketById: (req, res) => {
    ticketModels
      .getTicketById(req.query.ticketId)
      .then((result) => {
        if (result.length > 0) {
          formatResult(res, 200, true, "success", result);
        } else {
          formatResult(res, 404, false, "ticket not found", null);
        }
      })
      .catch((err) => {
        formatResult(res, 400, false, err, null);
      });
  },
  updateTicketByUserId: (req, res) => {
    ticketModels
      .updateTicketByUserId(req.body, req.query.ticketId, req.params.userId)
      .then((result) => {
        if (result.changedRows !== 0) {
          ticketModels.getTicketById(req.query.ticketId).then((results) => {
            formatResult(res, 200, true, `success update ${result.changedRows} row`, results);
          });
        } else {
          formatResult(res, 404, false, "ticketId or userId not found", null);
        }
      })
      .catch((err) => {
        formatResult(res, 400, false, err, null);
      });
  },
  deleteTicketByUserId: (req, res) => {
    ticketModels
      .deleteTicketByUserId(req.query.ticketId, req.params.userId)
      .then((result) => {
        if (result !== 0) {
          formatResult(res, 200, true, `success delete ${result} row`, null);
        } else {
          formatResult(res, 404, false, "ticketId or userId not found", null);
        }
      })
      .catch((err) => {
        formatResult(res, 400, false, err, null);
      });
  },
};
