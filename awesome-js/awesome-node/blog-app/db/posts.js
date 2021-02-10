const mongoose = require('mongoose');

const postSchema = new mongoose.Schema({
    name: String,
    title: String,
    content: String,
    id: String
});

const POST = new mongoose.model("posts", postSchema);

module.exports={
    getAllPost:()=>{
        return new Promise((resolve, reject)=>{
            POST.find((err, data)=>{
                resolve(data)
            })
        })
    },

    newPost:(userData, post)=>{
        return new Promise((resolve, reject)=>{
            let newPost = new POST({
                name: userData.name,
                title: post.title,
                content: post.content,
                id: userData._id,
            })
            newPost.save()
            resolve()
        })
    },

    getOnePost:(id)=>{
        return new Promise((resolve, reject)=>{
            POST.find({id:id}, (err, data)=>{
                resolve(data)
            })
        })
    },

    deleteAPost:(id)=>{
        return new Promise((resolve,reject)=>{
            POST.deleteOne({_id:id}, (err)=>{
                resolve()
            })
        })
    },

    getAPostDetail:(id)=>{
        return new Promise((resolve, reject)=>{
            POST.find({_id:id}, (err, data)=>{
                resolve(data)
            })
        })
    },

    editPost:(id, data)=>{
        return new Promise((resolve, reject)=>{
          POST.updateOne({_id:id}, {title:data.title, content:data.content}, (err, data)=>{
              resolve(data)
          })  
        })
    },

    deleteOneUserPost:(_id)=>{
        return new Promise((resolve, reject)=>{
            POST.deleteMany({id:_id}, (err)=>{
                resolve()
            })
        })
    }
}