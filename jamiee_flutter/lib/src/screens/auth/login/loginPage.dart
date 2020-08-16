import 'package:flutter/material.dart';
import '../../../styles/text.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../providers/auth/login/loginProvider.dart';
import 'loginPageWidget.dart';
import '../../../styles/base.dart';
import '../socialMediaButton.dart';
import '../../../styles/colors.dart';

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
    print("+++++LOGIN PAGE REBUILD+++++");
    var a = Provider.of<LoginProvider>(context);
    return Scaffold(
      key: a.loginScaffoldKey,
      body: Container(
        padding: EdgeInsets.only(top: BaseStyles.topPadding),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 25.0,
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            color: AppColors.white,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.3,
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
                SizedBox(
                  child: LoginPageWidget(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/ForgotPasswordPage");
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 30.0),
                        width: 160.0,
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Forgot Password ?",
                          style: AppTextStyle.forgotPassword,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
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
                        Text("Don't have an account?",
                            style: AppTextStyle.dontHaveAccount),
                        Text(
                          " Sign Up",
                          style: AppTextStyle.createOne,
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
