const express = require("express");
const socketIo = require("socket.io");
const http = require("http");

const { addUser, getUser, getUsersInRoom, removeUser } = require("./users");

const router = require("./router");

const app = express();
const server = http.createServer(app);
const io = socketIo(server);

io.on("connection", socket => {

    socket.on('join', ({ name, room }, callback) => {
        const { error, user } = addUser({ id: socket.id, name, room });

        if(error) return callback(error);

        socket.emit("message", { user: "Bot", text: `${user.name} welcome to the ${room} chat server` });
        socket.broadcast.to(user.room).emit("message", { user: "Bot", text: `${name} has joined` })

        socket.join(user.room);
        callback();
    });

    socket.on("sendMessage", (message, callback) => {
        const user = getUser(socket.id);

        io.to(user.room).emit("message", { user: user.name, text: message });

        callback();
    })

    socket.on("disconnect", () => {
        console.log("user disconnected " + socket.id);
    })
});

app.use(router);

const port = process.env.PORT || 5000;
server.listen(port, () => console.log(`server started at port ${port}`));