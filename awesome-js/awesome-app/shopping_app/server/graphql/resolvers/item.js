const Item = require("../../models/Item");
const checkAuth = require("../../utils/checkAuth");
const { AuthenticationError } = require("apollo-server");
const { doTypesOverlap } = require("graphql");

module.exports = {
    Query: {
        getItems: async () => {
            try{
                const items = await Item.find().sort({ createdAt: -1 });
                return items;
            }catch(err){
                throw new Error(err);
            }
        },
        getItem: async (_, { id }) => {
            try{
                const item = await Item.findById(id);
                if(item){
                    return item;
                }else{
                    throw new Error("Item not found");
                }
            }catch(err){
                throw new Error(err);
            }
        }
    },

    Mutation: {
        createItem: async (_, data, context) => {
            console.log(data)
        }
    },

}