require("dotenv").config();

const jwt = require("jsonwebtoken");
const { AuthenticationError } = require("apollo-server");
module.exports = context => {
    const authHeader = context.req.headers.authorization;
    if(!authHeader) throw new Error("Authorization header must be provider");
    
    const token = authHeader.split('Bearer ')[1];
    if(!token) throw new Error("Authentication must be 'Bearer [token]'");

    try{
        const user = jwt.verify(token, process.env.jwtKey);
        return user;
    }catch(err){
        throw new AuthenticationError("Invalid/Expired token");
    }

}