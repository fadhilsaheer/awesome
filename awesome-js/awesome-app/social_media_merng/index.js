require("dotenv").config(); // for accessing env vars

const { ApolloServer } = require("apollo-server");
const gql = require("graphql-tag")

const typeDefs =  gql`
    type Query{
        sayHi: String!
    }
`

const resolvers = {
    Query: {
        sayHi: () => "Hello world"
    }
}

const server = new ApolloServer({typeDefs,resolvers});


const port = process.env.PORT || 5000;
server.listen({port}).then(({ url }) => {
    console.log(`server started at port ${url}`);
})