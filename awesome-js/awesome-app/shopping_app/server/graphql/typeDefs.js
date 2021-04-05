const gql = require("graphql-tag");

const typeDefs = gql`
    type User{
        id: ID!,
        name: String!,
        email: String!,
        password: String!,
        token: String!,
        isAdmin: Bool!,
    },
    type Item{
        id: ID!,
        name: String!,
        images: [String!],
        description: String!,
        price: String!,
    },
    input CreateItemDetail{
        name: String!,
        images: [String!],
        description: String!,
        price: String!,
    }
    type Query{
        getItems: [Item],
        getItem(id: ID!): Item
    }
    type Mutation{
        register(name: String!, email: String!, password: String!): User!,
        login(email: String!, password: String!): User!,
        createItem(itemDetails: CreateItemDetail!): Item!,
        deleteItem(id: ID!): String!,
    }
`;

module.exports = typeDefs;