import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final firebase = Firebase.initializeApp();
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
