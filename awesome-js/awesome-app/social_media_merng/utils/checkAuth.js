require("dotenv").config();

const jwt = require("jsonwebtoken");
const { AuthenticationError } = require("apollo-server");

module.exports = (context) => {
    const authHeader = context.req.headers.authorization;
    if(authHeader){
        const token = authHeader.split('Bearer ')[1]; // getting token from header
        if(token){
            try{
                const user = jwt.verify(token, process.env.jwtKey);
                return user;
            }catch(err){
                throw new AuthenticationError('Invalid/Expired token');
            }
        }else{
            throw new Error("Authentication must be 'Bearer [token]'")
        }
    }else{
        throw new Error("Authentication header must be provided")
    }
}