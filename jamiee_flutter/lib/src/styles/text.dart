import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './colors.dart';

class AppTextStyle {
  static TextStyle settingButton(Color color) {
    return GoogleFonts.openSans(
        fontSize: 24.0, textStyle: TextStyle(color: color));
  }

  static TextStyle settingButtonSubtitle(Color color) {
    return GoogleFonts.openSans(
        fontSize: 12.0, textStyle: TextStyle(color: color));
  }

  ///////

  static TextStyle loginButtonText(Color color) { return GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      textStyle: TextStyle(color: color));
  }

  ////////

  static TextStyle logoutButton(Color color) {
    return GoogleFonts.openSans(
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
        textStyle: TextStyle(color: color));
  }

  /////////

  static TextStyle get logoutTitle => GoogleFonts.openSans(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        textStyle: TextStyle(color: AppColors.black),
      );

  ///////

  static TextStyle get faqTitle => GoogleFonts.openSans(
        fontSize: 22.0,
        textStyle: TextStyle(color: AppColors.black),
      );
  //////
  static TextStyle get faqSubTitle => GoogleFonts.openSans(
        fontSize: 16.0,
        textStyle: TextStyle(color: AppColors.grayInputHeading),
      );
  //////
  static TextStyle get topHeading => GoogleFonts.openSans(
        fontSize: 40.0,
        fontWeight: FontWeight.w600,
        textStyle: TextStyle(color: AppColors.primaryBlue),
      );
  static TextStyle get appBarTitle => GoogleFonts.openSans(
        fontSize: 22.0,
        textStyle: TextStyle(color: AppColors.black),
      );
  //
  static TextStyle get drawerText => GoogleFonts.openSans(
      fontSize: 20.0, textStyle: TextStyle(color: AppColors.black));
  //
  static TextStyle get errorText => GoogleFonts.openSans(
      fontSize: 13.0, textStyle: TextStyle(color: AppColors.red));
  //

  static TextStyle tabText(Color _color) {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w900,
      textStyle: TextStyle(
        fontSize: 20.0,
        color: _color,
      ),
    );
  }

  static TextStyle get subheadingText => GoogleFonts.openSans(
      fontSize: 20.0, textStyle: TextStyle(color: AppColors.grayInputHeading));

  //
  static TextStyle get placeholderText => GoogleFonts.openSans(
      fontSize: 20.0, textStyle: TextStyle(color: AppColors.placeHolderInput));
}
