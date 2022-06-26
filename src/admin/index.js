const path = require("path");
const express = require("express");
const app = express();

app.use(express.static(path.join(__dirname, "../../public")));

app.set("port", 3101);

const server = app.listen(app.get("port"), () => {
  console.log(`http://localhost:${app.get("port")} `);
});


app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, "../../public/admin.html"));
  });