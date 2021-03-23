import 'package:flutter/material.dart';

class SocialLoginProvider with ChangeNotifier {
  // String emailByFirebase;
//   Future<void> googleSignUp() async {
//     await Firebase.initializeApp();
//     try {
//       final GoogleSignIn _googleSignIn = GoogleSignIn(
//         scopes: ['email'],
//       );
//       final FirebaseAuth _auth = FirebaseAuth.instance;

//       final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;

//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       final User user = (await _auth.signInWithCredential(credential)).user;
//       print("signed in " + user.phoneNumber);
//       requestToCheckLoginBefore(user.email);
//       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ChatHomePagePlatform()));

// //      return user;
//     } catch (e) {
//       print(e);
//     }
//   }

 
}
