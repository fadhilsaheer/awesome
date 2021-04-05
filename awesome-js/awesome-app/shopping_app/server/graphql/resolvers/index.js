const ItemResolvers = require("./item");

module.exports = {
    Query: {
        ...ItemResolvers.Query
    },
    Mutation: {
        ...ItemResolvers.Mutation
    }
}