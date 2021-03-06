require("dotenv").config(); // Import env Config

const express = require("express"); // Import express
const bodyParser = require("body-parser"); // Import body-parses
const cors = require("cors");
const morgan = require("morgan");
const app = express(); // Create method
const port = process.env.PORT || 5000; // Default PORT

const Routes = require("./src/routes/routes");

app.listen(port, () => {
  console.log(`\n App listening on port ${port} \n`);
}); // Create listening app

app.use(bodyParser.json()); // Body parse json
app.use(bodyParser.urlencoded({ extended: false })); // body type
app.use(cors());
app.use(morgan("dev"));

app.use(process.env.ROOT_PATH, Routes);
