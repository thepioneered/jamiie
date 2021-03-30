import 'package:flutter/material.dart';
import '../../../styles/text.dart';
import 'package:provider/provider.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import '../../../providers/auth/login/loginProvider.dart';
import 'loginPageWidget.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import '../../../styles/base.dart';
import '../socialMediaButton.dart';
import '../../../styles/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Future<String> signInWithGoogle() async {
  //   final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
  //   final GoogleSignInAuthentication googleSignInAuthentication =
  //       await googleSignInAccount.authentication;

  //   final AuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleSignInAuthentication.accessToken,
  //     idToken: googleSignInAuthentication.idToken,
  //   );

  //   final authResult = await _auth.signInWithCredential(credential);
  //   final User user = authResult.user;

  //   assert(!user.isAnonymous);
  //   assert(await user.getIdToken() != null);

  //   final currentUser = _auth.currentUser;
  //   assert(user.uid == currentUser.uid);

  //   return 'signInWithGoogle succeeded: $user';
  // }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 411, height: 683, allowFontScaling: false);

    var a = Provider.of<LoginProvider>(context);
    return Scaffold(
      key: a.loginScaffoldKey,
      backgroundColor: AppColors.white,
      body: Container(
        padding: EdgeInsets.only(top: BaseStyles.topPadding),
        child: SingleChildScrollView(
          child: Container(
            // height: MediaQuery.of(context).size.height - 22.0,
            height: 1.hp - 24.0,
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: Column(
              children: <Widget>[
                //30 percent of total space
                Container(
                  alignment: Alignment.center,
                  // height: height * 0.3,
                  height: 0.3.hp,
                  width: 200.0.w,
                  margin: EdgeInsets.symmetric(horizontal: 12.h),
                  padding: EdgeInsets.only(top: 3.h),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage("assets/LOGO1.jpg"),
                  )),
                ),
                SizedBox(
                  height: 15.0.h,
                ),

                //30 percent of total space
                Container(
                  // color: Colors.pinkAccent,

                  child: LoginPageWidget(),
                ),
//5 percent of total space
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/ForgotPasswordPage");
                  },
                  child: Container(
                    height: 0.05.hp,
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Forgot Password ?",
                      style: AppTextStyle.forgotPassword(),
                      // maxFontSize: 20.0,
                      // minFontSize: 12.0,
                      // maxLines: 1,
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    // color: Colors.pink,
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "or connect using",
                          style: AppTextStyle.connectUsing(),
                        ),
                        SizedBox(
                          height: 15.0.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SocialMediaButton(
                              buttonType: SocialType.Google,
                              onTap: () {
                                a.googleSignUp();
                              },
                            ),
                            SocialMediaButton(
                              buttonType: SocialType.Facebook,
                              onTap: () {},
                            ),
                            // SocialMediaButton(
                            //   buttonType: SocialType.Twitter,
                            // ),
                            // SocialMediaButton(
                            //   buttonType: SocialType.Linkdin,
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(bottom: 5.0.h),
                  child: GestureDetector(
                    // padding: EdgeInsets.zero,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          // maxFontSize: 16.0,
                          // minFontSize: 12.0,
                          // maxLines: 1,
                          style: AppTextStyle.dontHaveAccount,
                        ),
                        Text(
                          " Sign Up",
                          style: AppTextStyle.createOne,
                          // maxFontSize: 16.0,
                          // minFontSize: 12.0,
                          // maxLines: 1,
                        ),
                      ],
                    ),
                    onTap: () => Navigator.pushNamed(context, "/MobilePage"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
