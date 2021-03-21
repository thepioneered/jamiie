import 'package:firebase_auth/firebase_auth.dart';

class SocialLoginProviderLogin {
  // void registerAccount() async {
  //   final FirebaseAuth _auth = FirebaseAuth.instance;
  //   var googleAuth;
  //   final AuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );

  //   final User user = (await _auth.signInWithCredential(credential)).user;
  //   print("signed in " + user.email);

  //   Map<String, dynamic> body = await NetworkCalls.postDataToServer(
  //     shouldPagePop: true,
  //     key: signupScaffoldKey,
  //     endPoint: EndPoints.userRegistration,
  //     afterRequest: () {},
  //     body: signup.toJson(await LocalStorage.getMobile()),
  //   );
  // }
}

class SocialSignup {
  Map<String, dynamic> toJson(
          String _mobile, String _email, String _name) =>
      {
        "phone": _mobile,
        "email": _email,
        "name": _name,
      };
}
