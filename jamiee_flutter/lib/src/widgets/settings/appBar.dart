import 'package:flutter/material.dart';
import '../../styles/colors.dart';
import '../../styles/text.dart';

AppBar settingsAppBar({@required String title}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: AppTextStyle.appBarTitle,
    ),
    elevation: 0.0,
    leading: BackButton(
      color: AppColors.black,
    ),
    backgroundColor: Colors.transparent,
  );
}
