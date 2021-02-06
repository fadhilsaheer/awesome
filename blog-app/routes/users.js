var express = require("express");
var router = express.Router();
const POST = require("../db/posts");
const db = require("../db/db");
var hbs = require("handlebars");

/* GET users listing. */
router.get("/", function (req, res) {
  let id = req.query.id;
  let user = req.session.user;

  if (user) {
    db.getOneDetail(id).then((userData) => {
      POST.getOnePost(id).then((posts) => {
        if (user._id == id) {
          res.render("users/home/me", {
            user: user,
            admin: true,
            feeds: posts.reverse(),
            original_user: userData[0].name,
          });
        } else {
          res.render("users/home/me", {
            user: user,
            admin: false,
            feeds: posts.reverse(),
            original_user: userData[0].name,
          });
        }
      });
    });
  } else {
    res.redirect("/");
  }
});

//new post

router.get("/new", (req, res) => {
  let id = req.query.id;
  let user = req.session.user;
  if (user) {
    if (user._id == id) {
      res.render("users/home/new-post", { user: user });
    } else {
      res.redirect("/");
    }
  } else {
    res.redirect("/");
  }
});

router.post("/new", (req, res) => {
  let id = req.query.id;
  let user = req.session.user;

  if (user._id == id) {
    POST.newPost(user, req.body).then(() => {
      res.redirect("/");
    });
  } else {
    res.redirect("/");
  }
});

//--new post

//delete post

router.get("/delete-post", (req, res) => {
  if (req.session.user) {
    let id = req.query.id;
    let user_id = req.query.user;
    POST.deleteAPost(id).then(() => {
      res.redirect(`/users?id=${user_id}`);
    });
  }else{
    res.redirect('/')
  }
});

//---

//edit

router.get("/edit", (req, res) => {
  if (req.session.user) {
    let post_id = req.query.id;
    let user_id = req.query.user;
    POST.getAPostDetail(post_id).then((data) => {
      if (data[0].id == user_id) {
        res.render("users/home/edit-post", {
          user: req.session.user,
          title: data[0].title,
          content: data[0].content,
          _id: data[0]._id,
          og_id: data[0].id,
        });
      } else {
        res.redirect("/");
      }
    });
  } else {
    res.redirect("/");
  }
});

router.post("/edit", (req, res) => {
  if (req.session.user._id == req.query.og) {
    POST.editPost(req.query.id, req.body).then((data) => {
      res.redirect(`/users?id=${req.query.user}`);
    });
  } else {
    res.redirect("/");
  }
});

//settings

router.get("/settings", (req, res) => {
  if (req.session.user) {
    if (req.query.id == req.session.user._id) {
      res.render("users/home/settings", {
        user: req.session.user,
        err: req.session.del,
      });
      req.session.del = false
    } else {
      res.redirect("/");
    }
  } else {
    res.redirect("/");
  }
});

router.post("/change", (req, res) => {
  if (req.session.user._id == req.query.id) {
    if (req.body.p1 == req.body.p2) {
      db.changePass(req.session.user._id, req.body.p1).then(() => {
        res.redirect(`/users/settings?id=${req.query.id}`);
      });
    }
  }
});

//delete post

router.get("/delete", (req, res) => {
  let userId = req.session.user._id;

  if (req.query.root) {
    POST.deleteOneUserPost(userId).then(() => {
      res.redirect(`/users?id=${userId}`);
    });
  } else {
    res.redirect("/");
  }
});

module.exports = router;
