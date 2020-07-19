import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/styles/base.dart';
import 'package:jamiee_flutter/src/styles/text.dart';

Widget topHeading({@required String title}) {
  return Padding(
    padding: BaseStyles.headingPadding,
    child: Text(
      title,
      style: AppTextStyle.topHeading,
    ),
  );
}
