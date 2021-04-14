const { GraphQLServer } = require("graphql-yoga");



const server = new GraphQLServer();
server.start(({ port }) => console.log(`server started at port http://localhost:${port}/`));
