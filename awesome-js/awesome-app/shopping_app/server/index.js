require("dotenv").config();

const { ApolloServer } = require("apollo-server");
const mongoose = require("mongoose");

const databaseUrl = process.env.database;

const typeDefs = require("./graphql/typeDefs");
const resolvers = require("./graphql/resolvers/index");

const server = new ApolloServer({
    typeDefs,
    resolvers,
    context: ({ req }) => ({ req })
})

mongoose.connect(databaseUrl, { useUnifiedTopology: true, useNewUrlParser: true }).then(()=>{
    console.log(`[INFO] connected to database ${databaseUrl}`);
    const port = process.env.PORT || 5000;
    return server.listen(port)
}).then(({ url }) => {
    console.log(`[INFO] server started at port ${url}`);
})