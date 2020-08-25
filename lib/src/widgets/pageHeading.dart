import 'package:Jamiie/src/styles/colors.dart';
import 'package:flutter/material.dart';
import '.././styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';

class PageHeading {
  static Widget topHeading(
      {@required String title, @required String subTitle, @required height}) {
    return Container(
      height: height * 0.18,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            // padding: const EdgeInsets.only(bottom: 10.0),
            height: height * 0.10,
            alignment: Alignment.topLeft,
            child: AutoSizeText(
              title,
              style: AppTextStyle.authHeading,
              maxLines: 1,
              minFontSize: 18.0,
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: (height * 0.10) * 0.3),
            alignment: Alignment.topLeft,
            height: height * 0.08,
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
