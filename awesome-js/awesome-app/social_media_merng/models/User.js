const { Model, Schema } = require("mongoose");

const userSchema = new Schema({
    username: String,
    password: String,
    email: String,
    createdAt: String,
});

module.exports = Model("User", userSchema);