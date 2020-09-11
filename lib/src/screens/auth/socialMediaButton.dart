import '../../styles/base.dart';

import '../../styles/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaButton extends StatelessWidget {
  final SocialType buttonType;
  final Function onTap;

  const SocialMediaButton({Key key, this.buttonType, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 411, height: 683, allowFontScaling: false);

    IconData icon;
    Color iconColor;
    Color buttonColor;
    switch (buttonType) {
      case SocialType.Facebook:
        iconColor = Colors.white;
        buttonColor = AppColors.facebook;
        icon = FontAwesomeIcons.facebookF;
        break;
      case SocialType.Google:
        iconColor = Colors.white;
        buttonColor = AppColors.google;
        icon = FontAwesomeIcons.google;
        break;
      case SocialType.Twitter:
        iconColor = Colors.white;
        buttonColor = AppColors.twitter;
        icon = FontAwesomeIcons.twitter;
        break;
      case SocialType.Linkdin:
        iconColor = Colors.white;
        buttonColor = AppColors.linkdin;
        icon = FontAwesomeIcons.linkedin;
        break;
      default:
        iconColor = Colors.white;
        buttonColor = AppColors.facebook;
        icon = FontAwesomeIcons.facebookF;
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50.0.h,
          width: 50.0.w,
          decoration: BoxDecoration(color: buttonColor, shape: BoxShape.circle
              // borderRadius: BorderRadius.circular(BaseStyles.buttonRadius),
              ),
          child: Icon(
            icon,
            size: 25.0.sp,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}

enum SocialType { Facebook, Google, Twitter, Linkdin }
