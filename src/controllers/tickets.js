const ticketModels = require("../models/tickets");
const formatResult = require("../helpers/formatResult");

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
    ticketModels
      .getTicket(req.query, req.role)
      .then((result) => {
        formatResult(res, 200, true, "Success", result);
      })
      .catch((err) => {
        formatResult(res, 500, true, err, null);
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
