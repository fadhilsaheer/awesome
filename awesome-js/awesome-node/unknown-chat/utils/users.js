const users = []

const userJoin = (id, user) => {
    user = {
        id: id,
        name: user.name,
        email: user.email, 
        profile: user.profile
    }
    users.push(user)
}

const getAllUsers = () => {
    return users
}


function userLeave(id){
    const index = users.findIndex(user => user.id === id);

    if(index !== -1){
        return users.splice(index, 1)[0];
    }
}


function getOneUser(id){
    return users.filter(user => user.id === id);
}


module.exports = {
    userJoin,
    getAllUsers,
    userLeave,
    getOneUser,
}