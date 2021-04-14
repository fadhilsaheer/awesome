const { GraphQLServer } = require("graphql-yoga");

const typedefs = `
    type Message {
        id: ID!
        user: String!,
        content: String!
    }

    type Query {
        messages: [Messages!]
    }
`

const server = new GraphQLServer({ typeDefs });
server.start(({ port }) => console.log(`server started at port http://localhost:${port}/`));
