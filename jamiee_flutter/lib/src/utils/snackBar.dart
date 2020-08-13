import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/styles/colors.dart';
import 'package:jamiee_flutter/src/styles/text.dart';

class AppSnackBar {
  static SnackBar snackBar({
    @required String title,
    @required Color backgroundColor,
  }) {
    return SnackBar(
      duration: Duration(milliseconds: 1200),
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      content: Text(
        title,
        style:AppTextStyle.snackBar,
      ),
    );
  }
}
