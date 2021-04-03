require("dotenv").config(); // for accessing env vars

const { ApolloServer } = require("apollo-server");
const gql = require("graphql-tag");
const mongoose = require("mongoose");

const databaseUrl = process.env.database; // feel free to change
const Post = require("./models/Post");

const typeDefs =  gql`
    type Post{
        id: ID!,
        body: String!,
        createdAt: String!,
        username: String!,
    }
    type Query{
        getPosts: [Post]
    }
`

const resolvers = {
    Query: {
        async getPosts(){
            try{
                const posts = await Post.find();
                return posts;
            }catch(err){
                throw new Error(err);
            }
        }
    }
}

const server = new ApolloServer({typeDefs,resolvers});


// starting server after connecting database
mongoose.connect(databaseUrl, { useNewUrlParser: true, useUnifiedTopology: true }).then(()=>{
    console.log(`[INFO] connected to database ${databaseUrl}`);
    const port = process.env.PORT || 5000;
    return server.listen({port})
}).then(({ url }) => {
    console.log(`[INFO] server started at port ${url}`);
})
