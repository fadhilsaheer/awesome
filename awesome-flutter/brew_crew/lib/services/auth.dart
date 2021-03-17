import 'package:brew_crew/models/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  var firebase = Firebase.initializeApp();
  final _auth = FirebaseAuth.instance;

  // create user object based on firebase user

  BrewUser _userFromFirebaseUser(user) {
    return user != null ? BrewUser(uid: user.uid) : null;
  }

  // auth change user stream

  Stream<BrewUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // sign in anonymous

  Future signInAnonymous() async {
    try {
      var result = await _auth.signInAnonymously();
      var user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password

  Future signIn(String email, String password) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register email and password

  Future register(String email, String password) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
