const socket = io();

// Your web app's Firebase configuration
var firebaseConfig = {
  // firebaser coinfig that get from firbase
};
// Initialize Firebase
firebase.initializeApp(firebaseConfig);

var provider = new firebase.auth.GoogleAuthProvider();

firebase.auth().useDeviceLanguage();

function login() {
  firebase
    .auth()
    .signInWithPopup(provider)
    .then((data) => {
    
        let user = {
            name: data.additionalUserInfo.profile.name,
            email: data.additionalUserInfo.profile.email,
            profile: data.additionalUserInfo.profile.picture
        }

        sessionStorage.setItem("user", JSON.stringify(user))
        window.location.href = "../chats.html"


    })
    .catch((error) => {
      console.log(error);
      swal("Oops something went wrong !!", "login failed", "error");
    });
}

// check user

const user = JSON.parse(sessionStorage.getItem("user"))
let ifUser = user ? window.location.href="/chats.html" : false
