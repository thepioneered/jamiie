import 'package:flutter/material.dart';

import './colors.dart';

class AppTextStyle {
  static TextStyle settingButton(Color color) {
    return TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        fontSize: 22.0,
        color: color);
  }

  static TextStyle get hintText => TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        fontSize: 15.0,
        color: Colors.grey[400],
      );
  static TextStyle get dropDownStyle => TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
      fontSize: 15.0,
      color: AppColors.black);

  static TextStyle get dialogTitle => TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        fontSize: 18.0,
        color: AppColors.black,
      );
  static TextStyle dialogButton(Color _color) {
    return TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
        color: _color);
  }

  static TextStyle get forgotPassword => TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
      fontSize: 15.0,
      color: AppColors.primaryColorPurple);

  static TextStyle get authHeading => TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w700,
        fontSize: 36.0,
      );
  static TextStyle get dontHaveAccount => TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w300,
        fontSize: 15.0,
        color: AppColors.grayInputHeading,
      );
  static TextStyle get createOne => TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        fontSize: 18.0,
        color: AppColors.primaryColorPurple,
      );

  static TextStyle get forgotPasswordSubTitle => TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        fontSize: 16.0,
        color: Colors.grey[400],
      );
  static TextStyle get minMaxPeople => TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        fontSize: 15.0,
        color: Colors.grey[400],
      );
  static TextStyle get inputText => TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        fontSize: 16.0,
      );
  static TextStyle get snackBar => TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        fontSize: 15.0,
      );

  static TextStyle connectUsing() {
    return TextStyle(
        fontFamily: "Poppins",
        fontSize: 15.0,
        fontWeight: FontWeight.w400,
        color: AppColors.grayInputHeading);
  }

  static TextStyle settingButtonSubtitle(Color color) {
    return TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        fontSize: 12.0,
        color: color);
  }

  ///////

  static TextStyle loginButtonText(Color color) {
    return TextStyle(
      fontFamily: "Poppins",
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  ////////

  static TextStyle logoutButton(Color color) {
    return TextStyle(
        fontFamily: "Poppins",
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
        color: color);
  }

  /////////

  static TextStyle get logoutTitle => TextStyle(
      fontFamily: "Poppins",
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: AppColors.black);

  ///////

  static TextStyle get faqTitle =>
      TextStyle(fontFamily: "Poppins", fontSize: 22.0, color: AppColors.black);
  //////
  static TextStyle get faqSubTitle => TextStyle(
      fontFamily: "Poppins", fontSize: 16.0, color: AppColors.grayInputHeading);
  //////
  static TextStyle get topHeading => TextStyle(
      fontFamily: "Poppins",
      fontSize: 40.0,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryBlue);
  static TextStyle get appBarTitle => TextStyle(
        fontFamily: "Poppins",
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
      );
  //
  static TextStyle get drawerText => TextStyle(
        fontFamily: "Poppins",
        fontSize: 20.0,
      );
  //
  static TextStyle get errorText => TextStyle(
        fontFamily: "Poppins",
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: AppColors.red,
      );
  //

  static TextStyle tabText(Color _color) {
    return TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w900,
      fontSize: 20.0,
      color: _color,
    );
  }

  static TextStyle get subheadingText => TextStyle(
      fontFamily: "Poppins", fontSize: 20.0, color: AppColors.grayInputHeading);

  //
  static TextStyle get placeholderText => TextStyle(
      fontFamily: "Poppins", fontSize: 18.0, color: AppColors.placeHolderInput);
}
