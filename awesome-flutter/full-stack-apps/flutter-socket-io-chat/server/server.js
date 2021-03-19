const app = require("express")();
const http = require("http").createServer(app);
const io = require("socket.io")(http);

io.on("connection", (socket) => {
  console.log("user connected ", socket.id);
});

const port = process.env.PORT || 5000;
server.listen(port, () => console.log(`server started at port ${port}`));
