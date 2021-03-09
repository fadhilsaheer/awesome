const express = require("express");
const socketIo = require("socket.io");
const http = require("http");

const router = require("./router");

const app = express();
const server = http.createServer(app);
const io = socketIo(server);

io.on("connection", socket => {
    console.log("user connected " + socket.id);

    socket.on('join', ({ name, room }, callback) => {
        console.log(`${name} : ${room}`);
    })

    socket.on("disconnect", () => {
        console.log("user disconnected " + socket.id);
    })
});

app.use(router);

const port = process.env.PORT || 5000;
server.listen(port, () => console.log(`server started at port ${port}`));