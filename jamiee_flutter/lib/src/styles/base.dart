import 'package:flutter/material.dart';
import './colors.dart';

class BaseStyles {
  static double get topPadding => 24.0;
  static EdgeInsetsGeometry get headingPadding => const EdgeInsets.only(top: 25.0, left: 15.0);
  static BorderRadiusGeometry get radius => BorderRadius.circular(30.0);
  static double get loginWidgetHeight => 55.0;
  static List<BoxShadow> get boxShadow => [
        BoxShadow(
            color: AppColors.grayInputHeading.withOpacity(0.5),
            // color: AppColor.withOpacity(.5),
            blurRadius: 4.0,
            offset: Offset(1.0, 4.0))
      ];
  static EdgeInsetsGeometry get pagePadingLogin =>
      const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0);
  static EdgeInsetsGeometry get pagePadingDashboard =>
      const EdgeInsets.only(top: 30.0, bottom: 10.0);
}
