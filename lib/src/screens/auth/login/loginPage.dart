// import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../styles/text.dart';
import 'package:provider/provider.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import '../../../providers/auth/login/loginProvider.dart';
import 'loginPageWidget.dart';
import '../../../styles/base.dart';
import '../socialMediaButton.dart';
import '../../../styles/colors.dart';

// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => LoginProvider(),
//       child: LoginPageWidget(),
//     );
//   }
// }

class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   GoogleSignIn _googleSignIn = GoogleSignIn(
//     scopes: [
//       'email',
//       'https://www.googleapis.com/auth/contacts.readonly',
//     ],
//   );

//   Future<void> _handleSignIn() async {
//     try {
//       await _googleSignIn.signIn();
//     } catch (error) {
//       print(error);
//     }
//   }

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var a = Provider.of<LoginProvider>(context);
    return Scaffold(
      key: a.loginScaffoldKey,
      backgroundColor: AppColors.white,
      body: Container(
        padding: EdgeInsets.only(top: BaseStyles.topPadding),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 26.0,
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: <Widget>[
                //30 percent of total space
                Container(
                  alignment: Alignment.center,
                  height: height * 0.3,
                  width: 200.0,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  padding: const EdgeInsets.only(top: 3.0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    scale: 100.0,
                    image: AssetImage("assets/LOGO1.jpg"),
                  )),
                ),
                SizedBox(
                  height: 15.0,
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
                    // color: Colors.blueAccent,
                    height: height * 0.05,
                    alignment: Alignment.bottomRight,
                    child: AutoSizeText(
                      "Forgot Password ?",
                      style: AppTextStyle.forgotPassword(),
                      maxFontSize: 20.0,
                      minFontSize: 12.0,
                      maxLines: 1,
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
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SocialMediaButton(
                              buttonType: SocialType.Google,
                              // onTap: _handleSignIn,
                            ),
                            SocialMediaButton(
                              buttonType: SocialType.Facebook,
                              onTap: () {},
                            ),
                            SocialMediaButton(
                              buttonType: SocialType.Twitter,
                            ),
                            SocialMediaButton(
                              buttonType: SocialType.Linkdin,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.only(bottom: 3.0),
                  child: GestureDetector(
                    // padding: EdgeInsets.zero,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          "Don't have an account?",
                          maxFontSize: 16.0,
                          minFontSize: 12.0,
                          maxLines: 1,
                          style: AppTextStyle.dontHaveAccount,
                        ),
                        AutoSizeText(
                          " Sign Up",
                          style: AppTextStyle.createOne,
                          maxFontSize: 16.0,
                          minFontSize: 12.0,
                          maxLines: 1,
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
