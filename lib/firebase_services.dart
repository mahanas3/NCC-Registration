import 'package:firebase_auth/firebase_auth.dart';

class Authentification {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<Object> signInwithEmailandPassword(email, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email');
      } else if (e.code == 'wrong password') {
        print('wrong password provided for that user');
      }
     return _firebaseAuth;
    }
  }

  Future<Object> signupwithUsernameandPassword(email,password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    on FirebaseAuthException catch (e){
      if(e.code=='weak-password'){
        print('The password provided is too weak');
      }
      else if(e.code=='email-already-in-use'){
        print('The account already exist for the email');
      }
    }
    catch(e){
      print(e);
    }
    return "Signup";
  }
  // Future<void>addUsertoDb(
  // {required String name,required int contact,required String email,required String password}
  //     )async {
  //   addUsertoDb(name: name, contact: contact, email: email, password: password);
  //
  //
  // }
  Future<String>signOut() async {
    await FirebaseAuth.instance.signOut();

    return signOut();

  }
}
