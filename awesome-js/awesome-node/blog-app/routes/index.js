var express = require('express');
var router = express.Router();

const crypto = require('crypto-js')
const db = require('../db/db')
const POST = require('../db/posts')

/* GET home page. */
router.get('/', function(req, res, next) {
  POST.getAllPost().then(async(datas)=>{
    if(datas.length == 0){
      res.render('index', {
        user: req.session.user,
        feeds: datas.reverse(),
        isNotPost:true,
      });
    }else{
      res.render('index', {
        user: req.session.user,
        feeds: datas.reverse(),
        isNotPost:false,
      });
    }
  })
});


// login and signup

router.get('/signup', (req, res)=>{
  if(req.session.user){
    res.redirect('/')
  }else{
    res.render('users/login/signup', {err:req.session.signupErr})
    req.session.signupErr = false
  }
})

router.post('/signup', (req, res)=>{
  db.getDetail(req.body.name, true).then((userCheck)=>{
    db.getDetail(req.body.email, false).then((emailCheck)=>{
      db.doSignup(req.body, userCheck, emailCheck).then((permission)=>{
        if(permission == true){
          res.redirect('/login')
        }else{
          req.session.signupErr = true
          res.redirect('/signup')
        }
      })
    })
  })
})

router.get('/login', (req, res)=>{
  if(req.session.user){
    res.redirect('/')
  }else{
    res.render('users/login/login', {err:req.session.loginErr})
    req.session.loginErr = false
  }

})
router.post('/login', (req, res)=>{
  db.getDetail(req.body.email, false).then((data)=>{
      db.doLogin(req.body, data).then((dbData)=>{
      let permission = dbData[0]
      if(permission){
        req.session.user = dbData[1]
        res.redirect("/")
      }else{
        req.session.loginErr = true
        res.redirect('/login')
      }
    })
  })
})

router.get('/logout', (req, res)=>{
  req.session.destroy()
  res.redirect('/')
})

router.get('/delete', (req, res)=>{
  if(req.query.root){

    req.query.root = crypto.MD5(req.query.root)

    if(req.query.root == req.session.user.pass){
      let userId = req.session.user._id;
      db.deleteAccount(userId).then(()=>{
        req.session.destroy()
        res.redirect('/')
      })
    }else{
      req.session.del = true
      res.redirect(`/users/settings?id=${req.session.user._id}`)
    }


  }else{
    res.redirect('/')
  }
})

module.exports = router;
