import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTextStyle {
  static TextStyle get loginButtonText => GoogleFonts.spaceMono(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      textStyle: TextStyle(color: AppColors.white));

  static TextStyle tabText(Color _color) {
    return GoogleFonts.spaceMono(
      fontWeight: FontWeight.w900,
      textStyle: TextStyle(
        fontSize: 20.0,
        color: _color,
      ),
    );
  }
}
