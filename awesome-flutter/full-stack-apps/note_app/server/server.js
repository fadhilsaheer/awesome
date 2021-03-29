const express = require("express");
const bodyParser = require("body-parser");

const app = express();

const { connectDb, noteModel } = require("./db");

app.use(bodyParser.urlencoded({extended: true}))
app.use(bodyParser.json());

// --- ROUTES ---


// get
app.get("/", (req, res) => {
  noteModel.find().then((notes)=>{
      res.send(notes)
  })
});

app.get("/:id", (req, res)=>{
    noteModel.findOne({_id: req.params.id}).then(note => {
        res.send(note);
    });
})


// post
app.post("/", (req, res) => {
  const note = new noteModel({
      title: req.body.title,
      category: req.body.category,
      description: req.body.description,
      content: req.body.content,
  });
  note.save().then((note)=>{
      res.send(note)
  })
});


// delete

app.delete("/:id", (req, res)=>{
    noteModel.deleteOne({_id: req.params.id}).then(()=>{
        res.status(200).send()
    })
})


connectDb().then(() => {
  const port = process.env.PORT || 5000;
  app.listen(port, () => console.log(`server started at port ${port}`));
});
