const { model, Schema } = require("mongoose");

const UserSchema = new Schema({
    name: String,
    email: String,
    password: String
});

module.exports = model('Users', UserSchema);