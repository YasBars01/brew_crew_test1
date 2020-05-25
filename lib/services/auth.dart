import 'package:brew_crew_test1/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser and return only the uid of the user
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
    //    .map((FirebaseUser user) => _userFromFirebaseUser(user));
    .map(_userFromFirebaseUser);
  }

  // sign in anon - async task
  Future signInAnon() async {
    try {

      /*  Using :
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      Will result in:
      I/flutter (22071): FirebaseUser({uid: 7tzW2xgKuUb1z1uWQrRqxJe5zsS2, isAnonymous: true,
      phoneNumber: , providerData: [{uid: 7tzW2xgKuUb1z1uWQrRqxJe5zsS2, phoneNumber: ,
      providerId: firebase, displayName: , email: }], providerId: firebase, displayName: ,
      creationTimestamp: 1578557617763, lastSignInTimestamp: 1578557617763, email: , isEmailVerified: false})

      Using : return _userFromFirebaseUser(user);
      will return only:
      2020-01-10 11:01:00.570 22071-22562/com.example.brew_crew_test1 I/flutter: Instance of 'User'
      Streamlining the results instead of getting all the info, even those that we do not need

     *
     */

      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      print('sign in anon');
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }


  // sign in with email and pw

  // sign in with email and pw

  // register with email and pw

  // regirster using Google sign in

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