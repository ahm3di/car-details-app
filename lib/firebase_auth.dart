import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<bool> signInWithEmail(String email, String password) async{
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword
        (email: email, password: password);
      FirebaseUser user = result.user;
      if(user != null && user.isEmailVerified)
      return true;
      else
        return false;
    }catch (e){
      return false;
    }
  }

  Future<void> logOut() async {
    try {
      await _auth.signOut();
    }catch (e) {
      print("error while logging out");
    }

  }

  Future<bool> loginWithGoogle() async {
    try{
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount account = await googleSignIn.signIn();
      if (account == null)
        return false;
      AuthResult result = await _auth.signInWithCredential(GoogleAuthProvider.
      getCredential(idToken: (await account.authentication).idToken,
          accessToken: (await account.authentication).accessToken));
      if(result.user == null)
        return false;
      return true;
    }catch (e) {
      print("Error logging in with google");
      return false;
    }
  }

  final FirebaseAuth _registerAuth = FirebaseAuth.instance;
  Future<bool> signUpWithEmailAndPassword(String email, String password) async{
    try {
      AuthResult result = await _registerAuth.createUserWithEmailAndPassword
        (email: email, password: password);
      FirebaseUser user = result.user;
      user.sendEmailVerification();
      if(user != null)
        return true;
      else
        return false;
    }catch (e){
      return false;
    }
  }

}

