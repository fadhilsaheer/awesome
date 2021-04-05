require("dotenv").config()

const User = require("../../models/User");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const { UserInputError } = require("apollo-server-errors");

function generateToken(user){
    return jwt.sign({
        id: user.id,
        email: user.email,
        name: user.name,
    }, process.env.jwtKey, { expiresIn: '1h' });
}

module.exports = {
    Mutation: {
        register: async (_, { name, email, password }) => {
            let user = await User.findOne({ email });
            if(user){
                throw new UserInputError("Username is taken");
            }

            password = await bcrypt.hash(password, 12);

            const newUser = new User({
                email,
                password,
                name,
            });

            const res = await newUser.save();

            const token = generateToken(res);

            return{
                ...res._doc,
                id: res._id,
                token
            }
        },
        login: async (_, { email, password }) => {
            let user = await User.findOne({ email });

            if(!user){
                throw new UserInputError("User not found");
            }

            const match = await bcrypt.compare(password, user.password);

            if(!match){
                throw new UserInputError("Invalid credentials");
            }

            const token = generateToken(user);

            return {
                ...user._doc,
                id: user._id,
                token
            };
        }
    }
}