const formatResult = require("../helpers/formatResult");
const { inputOrder, getDetails, updateDetailsOrder, deleteOrder } = require("../models/ordered");

module.exports = {
  inputOrder: (req, res) => {
    inputOrder(req.body)
      .then((result) => {
        formatResult(res, 200, true, "Success Create Order", result);
      })
      .catch((err) => {
        formatResult(res, 500, false, err, null);
      });
  },
  getDetailsOrder: (req, res) => {
    getDetails(req.query, req.role)
      .then((result) => {
        formatResult(res, 200, true, "Success", result);
      })
      .catch((err) => {
        formatResult(res, 500, false, err, null);
      });
  },
  updateDetailsOrder: (req, res) => {
    updateDetailsOrder(req.body, req.params.id)
      .then((result) => {
        formatResult(res, 200, true, "Success Update Details", result);
      })
      .catch((err) => {
        formatResult(res, 500, false, err, null);
      });
  },
  deleteOrder: (req, res) => {
    deleteOrder(req.params.id)
      .then((result) => {
        formatResult(res, 200, true, result, null);
      })
      .catch((err) => {
        formatResult(res, 500, false, err, null);
      });
  },
};
