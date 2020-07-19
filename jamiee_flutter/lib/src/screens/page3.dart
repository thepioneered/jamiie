import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/styles/base.dart';
import 'package:jamiee_flutter/src/styles/text.dart';

class UserPool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: BaseStyles.pagePadingDashboard,
        child: Column(
          children: <Widget>[
            Padding(
              padding: BaseStyles.headingPadding,
              child: Text(
                "Joined Pool's",
                style: AppTextStyle.topHeading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
