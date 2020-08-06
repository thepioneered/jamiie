import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/app.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jamiee_flutter/src/providers/auth/loginProvider.dart';
import 'package:jamiee_flutter/src/screens/auth/loginPage.dart';
import 'package:jamiee_flutter/src/styles/base.dart';
import 'package:jamiee_flutter/src/styles/text.dart';
import 'package:provider/provider.dart';
import './socialMediaButton.dart';
import '../../styles/colors.dart';
import '../../widgets/button.dart';
// import '../../styles/base.dart';

class ChooseSignInPage extends StatelessWidget {
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
                  // constraints: const BoxConstraints(maxHeight: 340),
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
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ChangeNotifierProvider(
                    create: (context) => PasswordStatusLogin(),
                    child: LoginPage(),
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
                InkWell(
                  onTap: () {
                    print("Check");
                    Navigator.pushNamed(context, "/MobilePage");
                  },
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Have no account yet? ",
                          style: TextStyle(fontSize: 15.0),
                        ),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      ],
                    ),
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
