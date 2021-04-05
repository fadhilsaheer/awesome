const ItemResolvers = require("./item");
const UserResolvers = require("./user");

module.exports = {
    Query: {
        ...ItemResolvers.Query
    },
    Mutation: {
        ...ItemResolvers.Mutation,
        ...UserResolvers.Mutation
    }
}