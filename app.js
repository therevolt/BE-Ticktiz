require("dotenv").config(); // Import env Config

const express = require("express"); // Import express
const cors = require("cors");
const morgan = require("morgan");
const cron = require("node-cron");
const app = express(); // Create method
const port = process.env.PORT || 5000; // Default PORT

const Routes = require("./src/routes/index");
const connection = require("./src/configs/configs");

app.listen(port, () => {
  console.log(`\n App listening on port ${port} \n`);
  cron.schedule("0 1 * * *", () => {
    const data = [
      {
        movie_id: 2,
        date: `2021-05-${new Date().getDate()} 09:00:00`,
        cinema_id: 1,
      },
      {
        movie_id: 2,
        date: `2021-05-${new Date().getDate()} 09:00:00`,
        cinema_id: 2,
      },
      {
        movie_id: 2,
        date: `2021-05-${new Date().getDate()} 09:00:00`,
        cinema_id: 3,
      },
      {
        movie_id: 2,
        date: `2021-05-${new Date().getDate()} 13:00:00`,
        cinema_id: 1,
      },
      {
        movie_id: 2,
        date: `2021-05-${new Date().getDate()} 13:00:00`,
        cinema_id: 2,
      },
      {
        movie_id: 2,
        date: `2021-05-${new Date().getDate()} 13:00:00`,
        cinema_id: 3,
      }, // Batas
      {
        movie_id: 3,
        date: `2021-05-${new Date().getDate()} 09:00:00`,
        cinema_id: 1,
      },
      {
        movie_id: 3,
        date: `2021-05-${new Date().getDate()} 09:00:00`,
        cinema_id: 2,
      },
      {
        movie_id: 3,
        date: `2021-05-${new Date().getDate()} 09:00:00`,
        cinema_id: 3,
      },
      {
        movie_id: 3,
        date: `2021-05-${new Date().getDate()} 13:00:00`,
        cinema_id: 1,
      },
      {
        movie_id: 3,
        date: `2021-05-${new Date().getDate()} 13:00:00`,
        cinema_id: 2,
      },
      {
        movie_id: 3,
        date: `2021-05-${new Date().getDate()} 13:00:00`,
        cinema_id: 3,
      }, // Batas
      {
        movie_id: 4,
        date: `2021-05-${new Date().getDate()} 09:00:00`,
        cinema_id: 1,
      },
      {
        movie_id: 4,
        date: `2021-05-${new Date().getDate()} 09:00:00`,
        cinema_id: 2,
      },
      {
        movie_id: 4,
        date: `2021-05-${new Date().getDate()} 09:00:00`,
        cinema_id: 3,
      },
      {
        movie_id: 4,
        date: `2021-05-${new Date().getDate()} 13:00:00`,
        cinema_id: 1,
      },
      {
        movie_id: 4,
        date: `2021-05-${new Date().getDate()} 13:00:00`,
        cinema_id: 2,
      },
      {
        movie_id: 4,
        date: `2021-05-${new Date().getDate()} 13:00:00`,
        cinema_id: 3,
      }, // Batas
      {
        movie_id: 5,
        date: `2021-05-${new Date().getDate()} 09:00:00`,
        cinema_id: 1,
      },
      {
        movie_id: 5,
        date: `2021-05-${new Date().getDate()} 09:00:00`,
        cinema_id: 2,
      },
      {
        movie_id: 5,
        date: `2021-05-${new Date().getDate()} 09:00:00`,
        cinema_id: 3,
      },
      {
        movie_id: 5,
        date: `2021-05-${new Date().getDate()} 13:00:00`,
        cinema_id: 1,
      },
      {
        movie_id: 5,
        date: `2021-05-${new Date().getDate()} 13:00:00`,
        cinema_id: 2,
      },
      {
        movie_id: 5,
        date: `2021-05-${new Date().getDate()} 13:00:00`,
        cinema_id: 3,
      }, // Batas
      {
        movie_id: 26,
        date: `2021-05-${new Date().getDate()} 09:00:00`,
        cinema_id: 1,
      },
      {
        movie_id: 26,
        date: `2021-05-${new Date().getDate()} 09:00:00`,
        cinema_id: 2,
      },
      {
        movie_id: 26,
        date: `2021-05-${new Date().getDate()} 09:00:00`,
        cinema_id: 3,
      },
      {
        movie_id: 26,
        date: `2021-05-${new Date().getDate()} 13:00:00`,
        cinema_id: 1,
      },
      {
        movie_id: 26,
        date: `2021-05-${new Date().getDate()} 13:00:00`,
        cinema_id: 2,
      },
      {
        movie_id: 26,
        date: `2021-05-${new Date().getDate()} 13:00:00`,
        cinema_id: 3,
      },
    ];
    data.map((item, i) => {
      connection.query(
        "INSERT INTO `playlists` (`id`, `movie_id`, `cinema_id`, `playing_time`, `price`, `created_at`, `updated_at`) VALUES (NULL, ?, ?, ?, '10', current_timestamp(), current_timestamp());",
        [item.movie_id, item.cinema_id, item.date]
      );
      console.log(`[${i}] Success Input Playlist`);
    });
  });
}); // Create listening app

app.use(express.json()); // Body parse json
app.use(express.urlencoded({ extended: false })); // body type
app.use(cors());
app.use(morgan("dev"));
app.use("/avatar", express.static("./upload"));
app.use("/v1", Routes);

app.use("*", (req, res) => {
  if (req.params["0"].match("/v1")) {
    res.status(405).json({
      status: false,
      message: "Method Not Allowed",
      data: null,
    });
  }
});

app.on("disconnect", () => {
  console.log("Server Disconnected");
});
