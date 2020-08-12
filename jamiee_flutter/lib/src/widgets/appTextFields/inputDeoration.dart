import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/styles/colors.dart';
import 'package:jamiee_flutter/src/styles/text.dart';

class AppInputDecoration {
  static InputDecoration textFieldDecoration(
      IconData prefixIcon, GestureDetector onEyeClick, String hintText) {
    return InputDecoration(
      prefixIcon: Icon(prefixIcon),
      suffixIcon: onEyeClick == null ? null : onEyeClick,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      hintText: hintText,

      hintStyle: AppTextStyle.hintText,
      focusedBorder: OutlineInputBorder(
        gapPadding: 10.0,
        borderSide: BorderSide(color: AppColors.primaryColorPurple),
      ),
      // focusedBorder: OutlineInputBorder(
      //   gapPadding: 10.0,

      //   borderSide: BorderSide(style: BorderStyle.solid)
      // ),
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
