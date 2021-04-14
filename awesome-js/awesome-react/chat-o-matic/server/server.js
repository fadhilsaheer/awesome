const { GraphQLServer } = require("graphql-yoga");

const messages = [];

const typeDefs = `
    type Message {
        id: ID!
        user: String!,
        content: String!
    }

    type Query {
        messages: [Message!]
    }
`

const resolvers = {
    Query: {
        messages: () => messages,
    }
}

const server = new GraphQLServer({ typeDefs, resolvers });
server.start(({ port }) => console.log(`server started at port http://localhost:${port}/`));