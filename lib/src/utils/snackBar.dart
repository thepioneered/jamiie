import 'package:flutter/material.dart';
import '../styles/text.dart';

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
