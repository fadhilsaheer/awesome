require("dotenv").config(); // for accessing env vars

const { ApolloServer } = require("apollo-server");
const mongoose = require("mongoose");

const databaseUrl = process.env.database; // feel free to change

const typeDefs = require("./graphql/typeDefs");
const resolvers = require("./graphql/resolvers");

const server = new ApolloServer({typeDefs,resolvers});


// starting server after connecting database
mongoose.connect(databaseUrl, { useNewUrlParser: true, useUnifiedTopology: true }).then(()=>{
    console.log(`[INFO] connected to database ${databaseUrl}`);
    const port = process.env.PORT || 5000;
    return server.listen({port})
}).then(({ url }) => {
    console.log(`[INFO] server started at port ${url}`);
})
