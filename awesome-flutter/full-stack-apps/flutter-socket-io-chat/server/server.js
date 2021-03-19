const express = require("express");
const app = express();

const server = require("http").createServer(app);

const socketIo = require("socket.io");
const io = socketIo(server);

io.on("connection", (socket) => {
  console.log("user connected ", socket.id);
});

const port = process.env.PORT || 5000;
server.listen(port, () => console.log(`server started at port ${port}`));
