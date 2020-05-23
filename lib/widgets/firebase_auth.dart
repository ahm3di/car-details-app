import 'package:car_details_app/models/car_model.dart';
import 'package:car_details_app/widgets/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static String userID ="";

  Future<bool> signInWithEmail(String email, String password) async{
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword
        (email: email, password: password);
      FirebaseUser user = result.user;
      userID = user.uid;

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
      print("Error while logging out");
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
      userID = result.user.uid;
      if(result.additionalUserInfo.isNewUser)
        await DatabaseService(uid: result.user.uid).updateUserData("","","","","","",false,false,false,"","","",false);
      cars.addAll(DatabaseService(uid: result.user.uid).getData());
      print(cars.length);

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
      await DatabaseService(uid: result.user.uid).updateUserData("","","","","","",false,false,false,"","","",false);
      if(user != null)
        return true;
      else
        return false;
    }catch (e){
      return false;
    }
  }

  Future<bool> resetPassword(String email) async{
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    }catch (e){
      return false;
    }
  }
}

