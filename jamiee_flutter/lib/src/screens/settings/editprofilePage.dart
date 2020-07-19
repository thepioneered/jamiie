import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/widgets/settings/appBar.dart';

class EditprofilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsAppBar(title: "Edit Profile"),
      body: Center(
        child: Text("EDit profile Page"),
      ),
    );
  }
}
