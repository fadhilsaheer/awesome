const app = require("express")();
const http = require("http").createServer(app);
const io = require("socket.io")(http);

io.on("connection", (socket) => {
  // get room name and join in room

  room = socket.handshake.query.room;
  socket.join(room);
  console.log(room);
});

const port = process.env.PORT || 5000;
http.listen(port, () => console.log(`server started at port ${port}`));
