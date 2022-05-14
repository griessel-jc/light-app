const express = require("express");
const Sequelize = require("sequelize");
const app = express();
const { Client } = require("pg");
var expressWs = require("express-ws")(app);
const env = require("./config.json").dev;

var aWss = expressWs.getWss("/");

const dbClient = new Client({
  connectionString:
    "postgresql://postgres:postgres@127.0.0.1:5432/AditivLEDSystem",
});
dbClient.connect((err, client, done) => {
  if (err) {
    console.log("Error for client connecting to DB");
  } else {
    console.log("Client connected to DB");
    client.on("notification", (msg) => {
      const data = msg.payload;
      console.log(data);
      aWss.clients.forEach((wsclient) => {
        wsclient.send(data);
      });
    });
    const query = client.query("LISTEN led_info_updated");
  }
});
const PORT = 8080;
const sequelize = new Sequelize(env.database, env.username, env.password, {
  host: env.host,
  dialect: env.dialect,
});

sequelize
  .authenticate()
  .then(() => {
    console.log("Connected to DB.");
  })
  .catch((err) => {
    console.error("Unable to connect to the DB:", err);
  });

const LEDInfo = sequelize.define(
  "led_info",
  {
    status: { type: Sequelize.TEXT },
    create_date: { type: Sequelize.DATE },
    id: { type: Sequelize.INTEGER, primaryKey: true },
  },
  { freezeTableName: true, timestamps: false }
);

LEDInfo.sync().then(() => {
  console.log("Sync complete");
});

app.ws("/", () => {
  console.log("A new client connected");
});

app.listen(PORT, () => console.log("Server is running"));
