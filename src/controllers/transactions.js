const trxModels = require("../models/transactions");
const formatResult = require("../helpers/formatResult");

module.exports = {
  inputTrx: (req, res) => {
    trxModels
      .inputTrx(req.body)
      .then((result) => {
        formatResult(res, 201, true, "Success", result);
      })
      .catch((err) => {
        formatResult(res, 404, false, err, null);
      });
  },
  getTrx: (req, res) => {
    trxModels
      .getTrx(req.query, req.role)
      .then((result) => {
        formatResult(res, 200, true, "Success", result);
      })
      .catch((err) => {
        formatResult(res, 500, false, err, null);
      });
  },
  editTrx: (req, res) => {
    trxModels
      .editTrx(req.body, req.params.id)
      .then((result) => {
        formatResult(res, 200, true, "Success Update Transaction", result);
      })
      .catch((err) => {
        formatResult(res, 500, false, err, null);
      });
  },
  deleteTrx: (req, res) => {
    trxModels
      .delMovie(req.params.id)
      .then((result) => {
        formatResult(res, 200, true, result, null);
      })
      .catch((err) => {
        formatResult(res, 500, false, err, null);
      });
  },
};
