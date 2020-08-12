import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/styles/text.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../providers/auth/login/loginProvider.dart';
import 'loginPageWidget.dart';
import '../../../styles/base.dart';
import '../socialMediaButton.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../styles/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Chooose Sign IN build");
    var loginProvider = Provider.of<LoginProvider>(context, listen: false);
    return Scaffold(
      key: loginProvider.loginScaffoldKey,
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
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  child: SvgPicture.asset(
                    "assets/LOGO.svg",
                  ),
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: SvgPicture.asset(
//  "assets/LOGO.svg",)
// );
//                     ),
                  // ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  // height: MediaQuery.of(context).size.height * 02,
                  child: MultiProvider(
                    providers: [
                      ChangeNotifierProvider(
                        create: (context) => PasswordStatusLogin(),
                      ),
                    ],
                    child: LoginPageWidget(),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/ForgotPasswordPage");
                  },
                  child: Container(
                      margin: const EdgeInsets.only(top: 30.0),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Forgot Password ?",
                        style: AppTextStyle.forgotPassword,
                      )),
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
                              onTap: _handleSignIn,
                            ),
                            SocialMediaButton(
                              buttonType: SocialType.Facebook,
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FlatButton(
                    padding: EdgeInsets.zero,
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
                    onPressed: () =>
                        Navigator.pushNamed(context, "/MobilePage"),
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
