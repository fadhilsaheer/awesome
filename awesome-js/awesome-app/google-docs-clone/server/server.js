const io = require("socket.io")(5000, {
    cors: {
        origin: 'http://localhost:4122', // change it accordingly
        methods: ['GET', 'POST']
    }
});

io.on('connection', socket => {});