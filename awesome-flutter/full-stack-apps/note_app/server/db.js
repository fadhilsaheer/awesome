const mongoose = require("mongoose");

const connectDb = () => {
  return new Promise((resolve, reject) => {
    mongoose
      .connect("mongodb://localhost:27017/notes")
      .then(() => {
        resolve();
      })
      .catch((e) => {
        console.log(e);
        reject();
      });
  });
};

const schema = mongoose.Schema({
    title: String,
    category: String,
    description: String,
    content: String,
});

const noteModel = mongoose.model("notes", schema);

module.exports = {
  connectDb,
  noteModel
};
