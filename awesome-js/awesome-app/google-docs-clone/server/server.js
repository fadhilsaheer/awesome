const io = require("socket.io")(5000, {
    cors: {
        origin: 'http://localhost:4122', // change it accordingly
        methods: ['GET', 'POST']
    }
});

console.log("server started");

io.on('connection', socket => {
    console.log(`client connected ${socket.id}`)
    socket.on('send-changes', delta => {
        socket.broadcast.emit('receive-changes', delta);
    })
});