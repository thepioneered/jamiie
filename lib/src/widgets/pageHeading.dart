import 'package:flutter/material.dart';
import '.././styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageHeading {
  static Widget topHeading(
      {@required String title, @required String subTitle, double height}) {
    return Container(
      height: 0.18.hp,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: AutoSizeText(
              title,
              maxLines: 1,
              style: AppTextStyle.authHeading,
              minFontSize: 18.0,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: AutoSizeText(
              subTitle,
              style: AppTextStyle.forgotPasswordSubTitle,
              minFontSize: 12.0,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
