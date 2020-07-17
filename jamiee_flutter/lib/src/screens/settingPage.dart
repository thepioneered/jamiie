import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/providers/faqData.dart';
import 'package:jamiee_flutter/src/styles/colors.dart';
import 'package:provider/provider.dart';
import '../styles/base.dart';
import '../styles/text.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: BaseStyles.pagePadingDashboard,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: BaseStyles.headingPadding,
              child: Text(
                "Settings",
                style: AppTextStyle.topHeading,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
              child: Column(
                children: <Widget>[
                  AppSettingButtons(
                    title: "Profile",
                    subtitle: "Change your profile",
                    // color: LogoColors.darkBlue,
                    onTap: null,
                  ),
                  AppSettingButtons(
                    title: "Contact Us",
                    subtitle: "Contact us for more support",
                    // color: LogoColors.purple,
                    onTap: () {
                      Navigator.pushNamed(context, "/ContactPage");
                    },
                  ),
                  AppSettingButtons(
                      title: "FAQ's",
                      subtitle: "Checkout some FAQ's",
                      // color: LogoColors.green,
                      onTap: () {
                        Navigator.pushNamed(context, "/FaqPage");
                      }),
                  AppSettingButtons(
                    title: "Logout",
                    subtitle: "Logout from your account",
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                              title: Text("Are you sure you want to logout?"),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.pop(ctx);
                                  },
                                ),
                                SizedBox(
                                  width: 3.0,
                                ),
                                FlatButton(
                                  color: AppColors.primaryBlue,
                                  child: Text("Logout"),
                                  onPressed: () {
                                    //TODO:Logout Functioning will come here
                                    Navigator.pop(ctx);
                                  },
                                ),
                              ],
                            );
                          });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class AppSettingButtons extends StatelessWidget {
  final String title;
  final String subtitle;
  // final Color color;
  final Function onTap;

  const AppSettingButtons(
      {@required this.title,
      @required this.subtitle,
      // @required this.color,
      @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 5.0),
        padding: const EdgeInsets.only(left: 15.0),
        width: double.infinity,
        height: 65.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              title,
              style: AppTextStyle.settingButton(AppColors.black),
            ),
            Text(
              subtitle,
              style: AppTextStyle.settingButtonSubtitle(
                  AppColors.grayLoginTabColor),
            ),
          ],
        ),
      ),
    );
  }
}
