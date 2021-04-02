const express = require("express");
const app = express();
const server = require("http").createServer(app);

const cors = require("cors");
app.use(cors());

const io = require("socket.io");

io.on('connection', socket => {
    console.log(`user connected ${socket.id}`);

    socket.join('flutter-room');

    socket.on('msg', msg => {
        socket.emit('msg', msg)
    })
})

const port = process.env.PORT || 5000;
server.listen(port, () => console.log(`server started at port ${port}`));