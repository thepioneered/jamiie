import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppIcons {
  static FaIcon get barsIcon => FaIcon(FontAwesomeIcons.bars);
  static FaIcon get logoutIcon => FaIcon(
        FontAwesomeIcons.signOutAlt,
        size: 20.0,
      );
  static FaIcon get infoIcon => FaIcon(
        FontAwesomeIcons.info,
      );
  static FaIcon get profileIcon => FaIcon(
        FontAwesomeIcons.userCircle,
        size: 20.0,
      );
  static FaIcon get questionIcon => FaIcon(
        FontAwesomeIcons.questionCircle,
        size: 20.0,
      );
  static FaIcon get accountIcon => FaIcon(
        FontAwesomeIcons.key,
        size: 20.0,
      );

  static FaIcon get searchIcon => FaIcon(
        FontAwesomeIcons.search,
      );
  static IconData get dollarIcon => FontAwesomeIcons.dollarSign;
}
