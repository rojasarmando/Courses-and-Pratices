const express = require("express");
const socketIO = require("socket.io");
const app = express();

app.set("port", 3100);

const server = app.listen(app.get("port"), () => {
  console.log(`Puerto: ${app.get("port")} `);
});

io = socketIO(server, {
  cors: true,
  origins: ["*"],
});

io.on("connection", (socket) => {
  console.log("Nueva Conexion: ", socket.id);

  socket.on("chat:message", (data) => {
    io.sockets.emit("chat:message", data);
    console.log(data);
  });

  socket.on("chat:typing", (username) => {
    socket.broadcast.emit("chat:typing", username);
  });
});
