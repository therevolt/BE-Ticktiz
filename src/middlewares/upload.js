const multer = require("multer");
const formatResult = require("../helpers/formatResult");
require("dotenv").config(); // Import env Config

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    if (req.route.path === "/:movieId") {
      req.body.image = `${process.env.HOST}:${process.env.PORT}${process.env.STATIC_FOLDER}/${
        Date.now() + "_" + file.originalname
      }`;
    } else {
      req.body.avatar = `${process.env.HOST}:${process.env.PORT}${process.env.STATIC_FOLDER}/${
        Date.now() + "_" + file.originalname
      }`;
    }
    cb(null, "./upload");
  },
  filename: function (reqs, file, cb) {
    cb(null, Date.now() + "_" + file.originalname);
  },
});

const upload = (name) =>
  multer({
    storage: storage,
    limits: {
      // fieldSize: 20000,
      fileSize: 15000000,
    },
    fileFilter: (req, file, cb) => {
      if (
        file.mimetype == "image/png" ||
        file.mimetype == "image/jpg" ||
        file.mimetype == "image/jpeg"
      ) {
        cb(null, true);
      } else {
        cb(null, false);
        return cb(new Error("Only .png, .jpg and .jpeg format allowed!"));
      }
    },
  }).single(name);

const middleUpload = (key) => (req, res, next) => {
  upload(key)(req, res, (err) => {
    if (err) {
      formatResult(res, 500, false, "file not uploaded since it's not a image file", null);
    } else {
      next();
    }
  });
};

module.exports = middleUpload;
