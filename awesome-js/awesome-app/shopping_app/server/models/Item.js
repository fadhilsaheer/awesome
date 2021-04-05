const { model, Schema } = require("mongoose");

const ItemSchema = new Schema({
    name: String,
    description: String,
    price: String,
    images: [String],
    createdAt: String,
});

module.exports = model('Items', ItemSchema);