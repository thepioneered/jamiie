import 'package:flutter/material.dart';
import '../../styles/colors.dart';
import '../../styles/text.dart';

class AppInputDecoration {
  static InputDecoration textFieldDecoration(
      IconData prefixIcon, Widget onEyeClick, String hintText) {
    return InputDecoration(
      prefixIcon: Icon(prefixIcon),
      suffixIcon: onEyeClick,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      hintText: hintText,
      hintStyle: AppTextStyle.hintText,
      focusedBorder: OutlineInputBorder(
        gapPadding: 10.0,
        borderSide: BorderSide(color: AppColors.primaryColorPurple),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.grayInputHeading),
        gapPadding: 10.0,
      ),
      focusedErrorBorder: OutlineInputBorder(
        gapPadding: 10.0,
        borderSide: BorderSide(color: AppColors.red),
      ),
      errorStyle: AppTextStyle.errorText,
      errorBorder: OutlineInputBorder(
        gapPadding: 10.0,
        borderSide: BorderSide(color: AppColors.red),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.grayInputHeading),
        gapPadding: 10.0,
      ),
    );
  }
}
