import 'package:flutter/material.dart';
import './colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseStyles {
  static double get buttonRadius => 40.0;
  static double get topPadding => 24.0.h;
  static EdgeInsetsGeometry get headingPadding =>
      EdgeInsets.only(top: 25.0.h, left: 15.0.h);
  static BorderRadiusGeometry get radius => BorderRadius.circular(30.0);
  static double get loginWidgetHeight => 55.0.h;
  static List<BoxShadow> get boxShadow => [
        BoxShadow(
            color: AppColors.grayInputHeading.withOpacity(0.5),
            blurRadius: 4.0,
            offset: Offset(1.0, 4.0))
      ];
  static EdgeInsetsGeometry get pagePadingLogin =>
      EdgeInsets.only(left: 30.0.w, right: 30..w, top: 30.0.h);
  static EdgeInsetsGeometry get pagePadingDashboard =>
      EdgeInsets.only(top: 30.0.h, bottom: 10.0.h);
}
