import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jamiee_flutter/src/providers/faqData.dart';
import 'package:jamiee_flutter/src/styles/colors.dart';
import 'package:jamiee_flutter/src/utils/icons.dart';
import 'package:jamiee_flutter/src/widgets/settings/logoutDialog.dart';
import 'package:jamiee_flutter/src/widgets/topHeading.dart';
import 'package:provider/provider.dart';
import '../../styles/base.dart';
import '../../styles/text.dart';

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
            topHeading(title: "Settings"),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
              child: Column(
                children: <Widget>[
                  AppSettingButtons(
                    title: "Profile",
                    subtitle: "Edit your profile",
                    icon: AppIcons.accountIcon,
                    onTap: () {
                      Navigator.pushNamed(context, "/EditprofilePage");
                    },
                  ),
                  AppSettingButtons(
                    title: "Contact Us",
                    subtitle: "Contact us for more support",
                    icon: AppIcons.questionIcon,
                    onTap: () {
                      Navigator.pushNamed(context, "/ContactPage");
                    },
                  ),
                  AppSettingButtons(
                      title: "FAQ's",
                      subtitle: "Checkout some FAQ's",
                      icon: AppIcons.profileIcon,
                      onTap: () {
                        Navigator.pushNamed(context, "/FaqPage");
                      }),
                  AppSettingButtons(
                    title: "Logout",
                    subtitle: "Logout from your account",
                    icon: AppIcons.logoutIcon,
                    onTap: () {
                      appLogoutDialog(context);
                    },
                  ),
                  AppSettingButtons(
                    title: "About Us",
                    subtitle: "Check out more about us",
                    icon: AppIcons.infoIcon,
                    onTap: () {
                      Navigator.pushNamed(context, "/AboutusPage");
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
  final Function onTap;
  final FaIcon icon;

  const AppSettingButtons({
    @required this.title,
    @required this.subtitle,
    @required this.onTap,
    @required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 5.0),
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        width: double.infinity,
        height: 65.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20.0,
              child: Align(
                alignment: Alignment.center,
                child: icon != null ? icon : Icon(Icons.add),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
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
          ],
        ),
      ),
    );
  }
}
