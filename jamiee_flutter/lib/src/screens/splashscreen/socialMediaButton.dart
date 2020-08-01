// import 'package:FarmingApp/src/styles/base.dart';
// import 'package:FarmingApp/src/styles/button.dart';
import 'package:jamiee_flutter/src/styles/base.dart';

import '../../styles/colors.dart';

import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaButton extends StatelessWidget {
  final SocialType buttonType;

  const SocialMediaButton({Key key, this.buttonType}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
      child: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(BaseStyles.buttonRadius),
        ),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}

enum SocialType { Facebook, Google,Twitter,Linkdin }
