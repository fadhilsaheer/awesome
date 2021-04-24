const mongoose = require("mongoose");
const Document = require("./document");

mongoose.connect('mongodb://localhost/google-docs', {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useFindAndModify: false,
    useCreateIndex: true
});

const io = require("socket.io")(5000, {
    cors: {
        origin: 'http://localhost:3000', // change it accordingly
        methods: ['GET', 'POST']
    }
});

console.log("server started");

io.on('connection', socket => {
    socket.on('get-document', async documentId => {
        const document = await findOrCreateDocument(documentId);
        socket.join(documentId);
        socket.emit('load-document', document.data);

        socket.on('send-changes', delta => {
            socket.broadcast.to(documentId).emit('receive-changes', delta);
        });

        socket.on('save-document', async data => {
            await Document.findByIdAndUpdate(documentId, { data });
        });

    })
});

async function findOrCreateDocument(id) {
    if (!id) return;

    const document = await Document.findById(id);
    if (document) return document;

    return await Document.create({ _id: id, data: "" });
}