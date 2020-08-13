import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/screens/userPoolScreens/searchPoolPage.dart';
import '../../styles/base.dart';
import '../../utils/icons.dart';
import '../../widgets/topHeading.dart';

class MyPool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: AppIcons.searchIcon,
        onPressed: () {
          //TODO
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SearchPoolPage()));
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
