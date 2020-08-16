import 'package:flutter/material.dart';
import '../styles/base.dart';
import '../styles/text.dart';

Widget topHeading({
  @required String title,
}) {
  return Padding(
    padding: BaseStyles.headingPadding,
    child: Text(
      title,
      style: AppTextStyle.authHeading,
    ),
  );
}
