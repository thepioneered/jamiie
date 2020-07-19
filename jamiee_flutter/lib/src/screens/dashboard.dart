import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/styles/text.dart';
import 'package:jamiee_flutter/src/widgets/topHeading.dart';
import '../styles/colors.dart';
import '../utils/icons.dart';
import '../widgets/drawer.dart';
import '../styles/base.dart';

class DashboardPagePlatform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: DashboardPage(),
      );
    } else {
      return Scaffold(
        body: DashboardPage(),
      );
    }
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: BaseStyles.topPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            topHeading(title: "Dashboard"),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[],
                  ),
                  Column(
                    children: <Widget>[
                      DashboardContainer(
                        ctx: context,
                        height: MediaQuery.of(context).size.height / 3,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      DashboardContainer(
                        ctx: context,
                        height: MediaQuery.of(context).size.height / 3,
                      ),
                      DashboardContainer(
                        ctx: context,
                        height: MediaQuery.of(context).size.height / 3,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DashboardContainer extends StatelessWidget {
  final BuildContext ctx;
  final double height;

  const DashboardContainer({this.ctx, this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.purpleAccent,
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: (MediaQuery.of(ctx).size.width / 2) - 10.0,
      height: height,
      child: Column(
        children: <Widget>[
          Text("HEading"),
        ],
      ),
    );
  }
}
