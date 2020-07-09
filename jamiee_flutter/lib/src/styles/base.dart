import 'package:flutter/material.dart';
import './colors.dart';

class BaseStyles {
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
      const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0, bottom: 10.0);
  static EdgeInsetsGeometry get pagePadingDashboard =>
      const EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0, bottom: 10.0);
}
