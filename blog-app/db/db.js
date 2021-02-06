const mongoose = require("mongoose");
const crypto = require('crypto-js')
const POST = require('./posts')

const DBURL = "mongodb://localhost:27017/blogApp";

const userSchema = new mongoose.Schema({
  name: String,
  email: String,
  pass: String,
});

const USER = new mongoose.model("users", userSchema);

module.exports = {
  connectDb: () => {
    mongoose.connect(DBURL, { useNewUrlParser: true }, () => {
      console.log("[INFO] database connected");
    });
  },

  getDetail:(userData, checkItem)=>{
    return new Promise((resolve, reject)=>{
      if(checkItem){
        USER.find({name:userData}, (err, data)=>{
          if(err){
            console.log(err);
          }else{
            resolve(data)
          }
        })
      }else{
        USER.find({email:userData}, (err, data)=>{
          if(err){
            console.log(err);
          }else{
            resolve(data)
          }
        })
      }
    })
  },

  doSignup:(userData, userCheck, emailCheck)=>{
    return new Promise(async(resolve, reject)=>{
      if(userCheck.length == 0){
        if(emailCheck.length == 0){
          userData.password = crypto.MD5(userData.password)
          let newUser = await new USER({
            name: userData.name,
            email: userData.email,
            pass: userData.password,
          })
          newUser.save()
          resolve(true)
        }
      }
      resolve(false)
    })    
  },

  doLogin:(userData, checkData)=>{
    return new Promise(async(resolve, reject)=>{
      let returnData = []
      if(checkData.length != 0){
        checkData = checkData[0]
        returnData = [true, checkData]
        userData.password = crypto.MD5(userData.password)

        if(userData.password == checkData.pass){
          resolve(returnData)
        }else{
          returnData = [false, null]
          resolve(returnData)
        }

        // bcrypt.compare(userData.password, checkData.pass).then((status)=>{
        //   resolve(returnData)
        // })
      }else{
        returnData = [false, null]
        resolve(returnData)
      }
    })
  },

  getOneDetail:(id)=>{
    return new Promise((resolve, reject)=>{
      USER.find({_id:id}, (err, data)=>{
        if(err){
          console.log(err);
        }else{
          resolve(data)
        }
      })
    })
  },

  changePass:(user, pass)=>{
    return new Promise(async(resolve, reject)=>{
      pass = crypto.MD5(pass)
      USER.updateOne({_id:user}, {pass:pass}, (err, data)=>{
        resolve()
      })
    })
  },

  deleteAccount:(user)=>{
    return new Promise((resolve, reject)=>{
      POST.deleteOneUserPost(user).then(()=>{
        USER.deleteOne({_id:user}, (err)=>{
          resolve()
        })
      })
    })
  }

};
