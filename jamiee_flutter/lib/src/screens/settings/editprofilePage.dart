import 'package:flutter/material.dart';
import '../../widgets/appBar.dart';

class EditprofilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.getAppBar(context, "Edit Profile"),
      body: Center(
        child: Text("EDit profile Page"),
      ),
    );
  }
}
