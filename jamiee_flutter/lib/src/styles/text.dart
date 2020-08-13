import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './colors.dart';

class AppTextStyle {
  static TextStyle settingButton(Color color) {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
        fontSize: 22.0, textStyle: TextStyle(color: color));
  }

  static TextStyle get hintText => GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: 15.0,
        textStyle: TextStyle(
          color: Colors.grey[400],
        ),
      );

  static TextStyle get dialogTitle => GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: 18.0,
        textStyle: TextStyle(color: AppColors.black),
      );
  static TextStyle dialogButton(Color _color) {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      fontSize: 14.0,
      textStyle: TextStyle(color: _color),
    );
  }

  static TextStyle get forgotPassword => GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 15.0,
      color: AppColors.primaryColorPurple);

  static TextStyle get authHeading => GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        fontSize: 36.0,
      );
  static TextStyle get dontHaveAccount => GoogleFonts.poppins(
        fontWeight: FontWeight.w300,
        fontSize: 15.0,
        textStyle: TextStyle(
          color: AppColors.grayInputHeading,
        ),
      );
  static TextStyle get createOne => GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: 18.0,
        textStyle: TextStyle(
          color: AppColors.primaryColorPurple,
        ),
      );
  // static TextStyle get forgotPassword => GoogleFonts.poppins(
  //       fontWeight: FontWeight.w700,
  //       fontSize: 36.0,
  //       textStyle: TextStyle(
  //         color: AppColors.black,
  //       ),
  //     );
  static TextStyle get forgotPasswordSubTitle => GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: 16.0,
        textStyle: TextStyle(
          color: Colors.grey[400],
        ),
      );
  static TextStyle get inputText => GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: 16.0,
        textStyle: TextStyle(),
      );
  static TextStyle get snackBar => GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: 15.0,
        textStyle: TextStyle(),
      );

  static TextStyle connectUsing() {
    return GoogleFonts.poppins(
        fontSize: 15.0,
        fontWeight: FontWeight.w400,
        textStyle: TextStyle(color: AppColors.grayInputHeading));
  }

  static TextStyle settingButtonSubtitle(Color color) {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
        fontSize: 12.0, textStyle: TextStyle(color: color));
  }

  ///////

  static TextStyle loginButtonText(Color color) {
    return GoogleFonts.poppins(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      textStyle: TextStyle(color: color),
    );
  }

  ////////

  static TextStyle logoutButton(Color color) {
    return GoogleFonts.poppins(
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
        textStyle: TextStyle(color: color));
  }

  /////////

  static TextStyle get logoutTitle => GoogleFonts.poppins(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        textStyle: TextStyle(color: AppColors.black),
      );

  ///////

  static TextStyle get faqTitle => GoogleFonts.poppins(
        fontSize: 22.0,
        textStyle: TextStyle(color: AppColors.black),
      );
  //////
  static TextStyle get faqSubTitle => GoogleFonts.poppins(
        fontSize: 16.0,
        textStyle: TextStyle(color: AppColors.grayInputHeading),
      );
  //////
  static TextStyle get topHeading => GoogleFonts.poppins(
        fontSize: 40.0,
        fontWeight: FontWeight.w600,
        textStyle: TextStyle(color: AppColors.primaryBlue),
      );
  static TextStyle get appBarTitle => GoogleFonts.poppins(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        textStyle: TextStyle(color: AppColors.black),
      );
  //
  static TextStyle get drawerText => GoogleFonts.poppins(
      fontSize: 20.0, textStyle: TextStyle(color: AppColors.black));
  //
  static TextStyle get errorText => GoogleFonts.poppins(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        textStyle: TextStyle(
          color: AppColors.red,
        ),
      );
  //

  static TextStyle tabText(Color _color) {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.w900,
      textStyle: TextStyle(
        fontSize: 20.0,
        color: _color,
      ),
    );
  }

  static TextStyle get subheadingText => GoogleFonts.poppins(
      fontSize: 20.0, textStyle: TextStyle(color: AppColors.grayInputHeading));

  //
  static TextStyle get placeholderText => GoogleFonts.poppins(
      fontSize: 18.0, textStyle: TextStyle(color: AppColors.placeHolderInput));
}
