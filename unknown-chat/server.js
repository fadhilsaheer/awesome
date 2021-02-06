const express = require("express");
const app = express();
app.use(express.static("public")); // resirecting to public


const socket = require("socket.io") // realtome data trasfer livrary

const { userJoin, userLeave, getOneUser, getAllUsers } = require("./utils/users");


// listening on port
const server_port = process.env.PORT || 3000
var server = app.listen(server_port, ()=> console.log(`server started at port ${server_port}`));

// socket connections
const io = socket(server);

io.on("connection", (socket)=>{

    // when a user joins

    socket.on("user-join", (data)=>{
        userJoin(socket.id, data);
        const users = getAllUsers()
        io.emit("clients", users);
    });

    // get user id
    socket.on("get-id", ()=>{
        socket.emit("id", socket.id)
    });


    // when user disconnects

    socket.on("disconnect", ()=> {
        userLeave(socket.id)
        const users = getAllUsers()
        io.emit("clients", users);
    });

    // get name of target

    socket.on("get-room", (id)=>{
        let user = getOneUser(id)
        socket.emit("send-user", user[0])
    })

    // rooms

    socket.on("joinRoom", (room)=>{
        socket.join(room);
    })

    // message
    socket.on("chatMessage", (msg, id)=>{
        const currentUser = getOneUser(socket.id);
        let targetUser;
        if(id == "public"){
            targetUser = {
                id: "public"
            }
        }else{
            targetUser = getOneUser(id);
            targetUser = targetUser[0]
        }
        io.sockets.to(id).emit("message", {currentUser, msg, targetUser})
    })
    socket.on("typing", (id)=>{
        const currentUser = getOneUser(socket.id);
        let targetUser;
        if(id == "public"){
            targetUser = {
                id: "public"
            }
        }else{
            targetUser = getOneUser(id);
            targetUser = targetUser[0]
        }
        io.sockets.to(id).emit("typing", {currentUser, targetUser})
    })
})