const { model, Schema } = require("mongoose");

const ItemSchema = new Schema({
    name: String,
    description: String,
    price: String,
    images: [
        {
            src: String
        }
    ]
});

module.exports = model('Items', ItemSchema);