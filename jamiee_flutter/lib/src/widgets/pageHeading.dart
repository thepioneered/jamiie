import 'package:flutter/material.dart';
import '.././styles/text.dart';

class PageHeading {
  static Widget topHeading(
      {@required String title, @required String subTitle}) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: AppTextStyle.authHeading,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 30.0),
          alignment: Alignment.topLeft,
          child: Text(
            subTitle,
            style: AppTextStyle.forgotPasswordSubTitle,
          ),
        ),
      ],
    );
  }
}
