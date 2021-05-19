import 'package:flutter/material.dart';
import '../../../styles/text.dart';
import 'package:provider/provider.dart';
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
            height: 1.hp - 24.0,
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
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
                Container(
                  child: LoginPageWidget(),
                ),
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
                    ),
                  ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: AppTextStyle.dontHaveAccount,
                        ),
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
