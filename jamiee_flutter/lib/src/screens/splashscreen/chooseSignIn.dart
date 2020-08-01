import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/app.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jamiee_flutter/src/screens/auth/loginPage.dart';
import 'package:jamiee_flutter/src/styles/text.dart';
import './socialMediaButton.dart';
import '../../styles/colors.dart';
import '../../widgets/button.dart';
// import '../../styles/base.dart';

class ChooseSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
                child: Text(
                  "Login",
                  style: AppTextStyle.topHeading,
                ),
              ),
              LoginPage(),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Have no account yet? "),
                  InkWell(
                    onTap: () {
                      print("Check");
                      Navigator.pushNamed(context, "/SignupPage");
                    },
                    child: Container(child: Text("Sign Up")),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
            ],
          )),
    );
  }
}
