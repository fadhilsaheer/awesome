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

  // sign in anonymous

  Future signInAnonymous() async {
    try {
      var result = await _auth.signInAnonymously();
      var user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password

  // register email and password

  // sign out

}
