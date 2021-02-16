import 'package:Jamiie/src/screens/Loan/loanListScreen.dart';
import 'package:Jamiie/src/screens/addBank/bankPage.dart';
import 'package:Jamiie/src/utils/sharedPref.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../providers/settings/logoutProvider.dart';
import 'package:provider/provider.dart';
import '../../styles/colors.dart';
import '../../utils/icons.dart';
import '../../widgets/topHeading.dart';
import '../../styles/base.dart';
import '../../styles/text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 411, height: 683, allowFontScaling: false);
    return ChangeNotifierProvider(
      create: (_) => LogoutProvider(),
      child: Consumer<LogoutProvider>(builder: (_, logoutProvider, child) {
        return Scaffold(
          key: logoutProvider.settingScaffoldKey,
          backgroundColor: AppColors.white,
          body: Container(
            padding: BaseStyles.pagePadingDashboard,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                topHeading(title: "Settings"),
                Container(
                  width: 1.wp,
                  margin: EdgeInsets.only(top: 0.1.hp),
                  child: Column(
                    children: <Widget>[
                      //TODO:Edit profile removed
                      // AppSettingButtons(
                      //   title: "Profile",
                      //   subtitle: "Edit your profile",
                      //   icon: AppIcons.accountIcon,
                      //   onTap: () {
                      //     Navigator.pushNamed(context, "/EditprofilePage");
                      //   },
                      // ),
                      AppSettingButtons(
                        title: "Add Bank",
                        subtitle: "Add your Bank",
                        icon: FaIcon(Icons.home),
                        onTap: () async {
                          //TODO: Isko push named bna na hai
                          String mobile = await LocalStorage.getMobile();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => BankPage(
                                        mobile: mobile,
                                      )));
                        },
                      ),
                      AppSettingButtons(
                        title: "Loan",
                        subtitle: "Checkout your loan",
                        icon: FaIcon(Icons.attach_money),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => LoanListScreen(),
                            ),
                          );
                        },
                      ),
                      AppSettingButtons(
                        title: "Contact Us",
                        subtitle: "Contact us for more support",
                        icon: AppIcons.headsetIcon,
                        onTap: () {
                          Navigator.pushNamed(context, "/ContactPage");
                        },
                      ),
                      AppSettingButtons(
                          title: "FAQ's",
                          subtitle: "Checkout some FAQ's",
                          icon: AppIcons.questionIcon,
                          onTap: () {
                            Navigator.pushNamed(context, "/FaqPage");
                          }),
                      AppSettingButtons(
                        title: "Logout",
                        subtitle: "Logout from your account",
                        icon: AppIcons.logoutIcon,
                        onTap: logoutProvider.handleLogout,
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
      }),
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
        margin: EdgeInsets.only(bottom: 5.0.h),
        padding: EdgeInsets.only(left: 15.0.h, right: 15.0.h),
        width: 1.wp,
        height: 0.09.hp,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20.0.w,
              child: Align(
                alignment: Alignment.center,
                child: icon != null ? icon : Icon(Icons.add),
              ),
            ),
            SizedBox(
              width: 20.0.w,
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
                      AppColors.grayInputHeading),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
