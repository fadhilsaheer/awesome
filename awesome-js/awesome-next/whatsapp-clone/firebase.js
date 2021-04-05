import firebase from "firebase";
import firebaseConfig from "./firebaseConfig"; // create one

const app = !firebase.apps.length
  ? firebase.initializeApp(firebaseConfig)
  : firebase.app;

const db = app.firestore();
const auth = app.auth();
const provider = firebase.auth.GoogleAuthProvider();

export { db, auth, provider };
