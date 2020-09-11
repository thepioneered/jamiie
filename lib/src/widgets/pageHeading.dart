import 'package:flutter/material.dart';
import '.././styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageHeading {
  static Widget topHeading(
      {@required String title, @required String subTitle,double height}) {
    return Container(
      //color: Colors.blue[100],
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
           // height: 0.10.hp,
            alignment: Alignment.topLeft,
            child: AutoSizeText(
              title,
              style: AppTextStyle.authHeading,
              maxLines: 1,
              minFontSize: 18.0,
            ),
          ),
          Container(
            // padding: EdgeInsets.only(bottom: (0.10.hp) * 0.3),
            alignment: Alignment.topLeft,
           // height: 0.08.hp,
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
