import 'package:Jamiie/src/styles/colors.dart';
import 'package:Jamiie/src/styles/text.dart';
import 'package:Jamiie/src/widgets/appBar.dart';
import 'package:flutter/material.dart';

class PoolScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.getAppBar(context, '', isRegistration: false),
      backgroundColor: AppColors.white,
          body: Container(
        child: Center(
          child: Text("Pool Started",
          style: AppTextStyle.authHeading),
        ),
      ),
    );
  }
}