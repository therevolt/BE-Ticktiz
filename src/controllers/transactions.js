const trxModels = require("../models/transactions");
const formatResult = require("../helpers/formatResult");

module.exports = {
  inputUser: (req, res) => {
    trxModels
      .inputTrx(req.body, req.params.userId)
      .then((result) => {
        formatResult(res, 201, true, `success`, result);
      })
      .catch((err) => {
        formatResult(res, 404, false, err, null);
      });
  },
  getTrxByStatus: (req, res) => {
    trxModels
      .getTrxByStatus(req.params.userId, req.query.status)
      .then((result) => {
        if (result.length >= 1) {
          formatResult(res, 200, true, `success`, result);
        } else {
          formatResult(res, 404, false, `transaction history not found`, null);
        }
      })
      .catch((err) => {
        formatResult(res, 400, false, err, null);
      });
  },
  getAllTrx: (req, res) => {
    trxModels
      .getAllTrx(req.params.userId)
      .then((result) => {
        if (result.length >= 1) {
          formatResult(res, 200, true, `success`, result);
        } else {
          formatResult(res, 404, false, `userId or transaction not found`, null);
        }
      })
      .catch((err) => {
        formatResult(res, 400, false, err, null);
      });
  },
  editTrxById: (req, res) => {
    trxModels
      .editTrxById(req.params.trxId, req.body)
      .then((result) => {
        formatResult(res, 200, true, `success update 1 row`, result);
      })
      .catch((err) => {
        formatResult(res, 400, false, err, null);
      });
  },
  deleteTrxById: (req, res) => {
    trxModels
      .deleteTrxById(req.params.trxId)
      .then((result) => {
        formatResult(res, 200, true, result, null);
      })
      .catch((err) => {
        formatResult(res, 400, false, err, null);
      });
  },
};
