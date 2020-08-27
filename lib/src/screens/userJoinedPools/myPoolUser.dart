
import 'package:Jamiie/src/styles/colors.dart';
import 'package:flutter/material.dart';
import '../../styles/base.dart';
import '../../utils/icons.dart';
import '../../widgets/topHeading.dart';

class MyPool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColorPurple,
        child: AppIcons.searchIcon,
        onPressed: () {
          Navigator.pushNamed(context, "/SearchPoolPage");
        },
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: BaseStyles.topPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              topHeading(title: "My Pool's"),
              Container(
                child: Column(
                  children: <Widget>[],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
