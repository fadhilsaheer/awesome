require("dotenv").config();

const User = require("../../models/User");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");

const { UserInputError } = require("apollo-server");
const { validateInputRegisters } = require("../../utils/validators");

module.exports = {
    Mutation: {
        async register(_, { registerInput: { username, email, password, confirmPassword } }){

            // validating forms

            const { errors, valid } = validateInputRegisters(username, email, password, confirmPassword);
            if(!valid){
                throw new UserInputError("Errors", { errors });
            }

            // validating user

            const user = await User.find({ username });

            if(user.length != 0){
                throw new UserInputError('Username is taken', {
                    errors: {
                        username: 'This username is taken'
                    }
                });
            }

            // registering user

            password = await bcrypt.hash(password, 12); // hashing password

            const newUser = new User({
                email,
                username,
                password,
                createdAt: new Date().toISOString(),
            });

            const res = await newUser.save();

            const token = jwt.sign({
                id: res.id,
                email: res.email,
                username: res.username,
            }, process.env.jwtKey, { expiresIn: '1h' });

            return {
                ...res._doc,
                id: res._id,
                token
            };
        }
    }
}