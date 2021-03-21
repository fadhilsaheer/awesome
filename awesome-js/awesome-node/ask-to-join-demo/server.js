const express = require("express");
const app = express();

let users = [];

app.use(express.static("public"))

app.get('/', (req, res) => {
    res.sendFile(`${__dirname}/public/index.html`);
})

app.get('/chat', (req, res)=>{
    res.sendFile(`${__dirname}/public/chat.html`)
})

const server = require('http').createServer(app);

const io = require("socket.io")(server);

io.on("connection", socket => {
    socket.on('join', ({ name, room })=>{
        if(users.length == 0){
            socket.join(room)
            users.push(name)
        }else{
            // socket.to(room).emit('user-conn', "user");
            io.to(room).emit('user-conn', socket.id)
        }
    })

    socket.on("reply", permission => {
        if(permission[0]){
            io.to(permission[1]).emit('true')
        }else{
            io.to(permission[1]).emit('false')
        }
    })
    
})

const port = process.env.PORT || 5000;
server.listen(port, ()=> console.log('server started'));