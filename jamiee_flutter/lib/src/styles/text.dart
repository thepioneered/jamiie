import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTextStyle {
  static TextStyle get loginButtonText => GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      textStyle: TextStyle(color: AppColors.white));
  static TextStyle get errorText => GoogleFonts.openSans(
      fontSize: 13.0, textStyle: TextStyle(color: AppColors.red));

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
  static TextStyle get placeholderText => GoogleFonts.openSans(
      fontSize: 20.0, textStyle: TextStyle(color: AppColors.placeHolderInput));
}
