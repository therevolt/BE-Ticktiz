const formatResult = require("../helpers/formatResult");
const {
  getPlaylists,
  insertPlaylists,
  editPlaylists,
  deletePlaylists,
} = require("../models/playlists");

module.exports = {
  getPlaylists: (req, res) => {
    getPlaylists(req.params.movie)
      .then((result) => {
        formatResult(res, 200, true, "Success", result);
      })
      .catch((err) => {
        formatResult(res, 500, false, err, null);
      });
  },
  insertPlaylists: (req, res) => {
    insertPlaylists(req.body)
      .then((result) => {
        formatResult(res, 200, true, result, null);
      })
      .catch((err) => {
        formatResult(res, 500, false, err, null);
      });
  },
  editPlaylists: (req, res) => {
    editPlaylists(req.body, req.params.playlists_id)
      .then((result) => {
        formatResult(res, 200, true, "Success Update Playlists", result);
      })
      .catch((err) => {
        formatResult(res, 500, false, err, null);
      });
  },
  deletePlaylists: (req, res) => {
    deletePlaylists(req.params.playlists_id)
      .then((result) => {
        formatResult(res, 200, true, result, null);
      })
      .catch((err) => {
        formatResult(res, 500, false, err, null);
      });
  },
};
