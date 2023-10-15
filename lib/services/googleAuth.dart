

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth{

  // Google Sign in
  googleSignIn() async{
    // begin interactive sign in process ( pop up that email selection page)
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // Finally lets sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


  
}

// CMD for SHA Keys
// keytool -list -v -keystore "C:\Users\Xmart\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android