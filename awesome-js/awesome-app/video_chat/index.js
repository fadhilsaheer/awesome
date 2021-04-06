const app = require("express")();
const server = require("http").createServer(app);
const cors = require("cors");

const io = require("socket.io")(server, {
    cors: {
        origin: '*',
        methods: ["GET", "POST"]
    }
});

app.use(cors());

const port = process.env.PORT || 5000;

app.get('/', (req, res)=>{
    res.send("Server is running")
});

io.on('connection', socket => {
    socket.emit('me', socket.id);

    socket.on('disconnect', ()=>{
        socket.broadcast.emit('callended');
    });

    socket.on("calluser", ({ userToCall, signalData, fromName })=>{
        io.to(userToCall).emit('callUser', { signal: signalData, from: fromName });
    })

    socket.on("answercall", data => {
        io.to(data.to).emit("callaccepted", data.signal);
    })

});



server.listen(port, ()=> console.log(`server listening on port ${port}`));