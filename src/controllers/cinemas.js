const formatResult = require("../helpers/formatResult");
const {
  getCinemas,
  getCinemasById,
  inputCinemas,
  editCinemas,
  deleteCinemas,
} = require("../models/cinemas");
const { client } = require("../middlewares/redis");

module.exports = {
  getCinemas: (req, res) => {
    getCinemas()
      .then((result) => {
        client.setex("cinema", 86400, JSON.stringify(result));
      })
      .catch((err) => {
        formatResult(res, 500, false, err, null);
      });
  },
  getCinemasById: (req, res) => {
    getCinemasById(req.params.id)
      .then((result) => {
        formatResult(res, 200, true, "Success", result);
      })
      .catch((err) => {
        formatResult(res, 500, false, err, null);
      });
  },
  inputCinemas: (req, res) => {
    inputCinemas(req.body)
      .then((result) => {
        formatResult(res, 201, true, "Success", result);
      })
      .catch((err) => {
        formatResult(res, 500, false, err, null);
      });
  },
  editCinemas: (req, res) => {
    editCinemas(req.body, req.params.id)
      .then((result) => {
        formatResult(res, 200, true, "Success Update Cinema", result);
      })
      .catch((err) => {
        formatResult(res, 500, false, err, null);
      });
  },
  deleteCinemas: (req, res) => {
    deleteCinemas(req.params.id)
      .then((result) => {
        formatResult(res, 200, true, result, null);
      })
      .catch((err) => {
        formatResult(res, 500, false, err, null);
      });
  },
};
