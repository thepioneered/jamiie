import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/styles/base.dart';
import 'package:jamiee_flutter/src/styles/text.dart';

import '../models/group.dart';
import '../widgets/adminGroup/addNewGroup.dart';
import '../widgets/adminGroup/groupList.dart';
import '../widgets/drawer.dart';

class UserPool extends StatefulWidget {
  @override
  _UserPoolState createState() => _UserPoolState();
}

class _UserPoolState extends State<UserPool> {
  final List<Group> _userGroup = [];
  void _addNewGroup(String title) {
    final newGroup = Group(title: title);
    setState(() {
      _userGroup.add(newGroup);
    });
  }

  void _startAddNewGroup(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewGroup(_addNewGroup),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startAddNewGroup(context);
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        padding: BaseStyles.pagePadingDashboard,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              GroupList(_userGroup),
            ],
          ),
        ),
      ),
    );
  }
}
