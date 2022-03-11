import 'package:weight_tracker/imports/imports.dart';

class Api {
//firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

// create user object based on firebase user
  Users? _userFromFirebaseUser(User? user) {
    return user != null ? Users(uid: user.uid, displayName: user.displayName, email: user.email, emailVerified: user.emailVerified, isAnonymous: user.isAnonymous, phoneNumber: user.phoneNumber, photoURL: user.photoURL, refreshToken: user.refreshToken) : null;
  }

// auth change user stream
  Stream<Users?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

// sign in anon
  Future signInAnon() async {
    try {
      User? user = (await _auth.signInAnonymously()).user;
      print(user.toString());
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// logout
  Future signOut() async {
    try {
     await _auth.signOut();
     await SharedPreferences.getInstance().then((prefs) async{
       await prefs.clear();
     });
     return "true";

    } catch (error) {
      print("got and error: " + error.toString());
      return "error";
    }
  }

}
