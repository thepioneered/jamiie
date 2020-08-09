import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../providers/auth/loginProvider.dart';
import 'loginPageWidget.dart';
import '../../styles/base.dart';
import 'socialMediaButton.dart';
import '../../styles/colors.dart';

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
            height: MediaQuery.of(context).size.height - 35.0,
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            color: AppColors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/login.png"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
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
                SizedBox(height: 20.0),
                Center(
                  child: Text("Or Sign Up Using"),
                ),
                SizedBox(height: 10.0),
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
                Expanded(
                  child: Container(),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    child: Text("Have no account? Signup",
                        style: TextStyle(fontSize: 18.0)),
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
