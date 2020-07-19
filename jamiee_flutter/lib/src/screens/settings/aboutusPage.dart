import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/widgets/settings/appBar.dart';

class AboutusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsAppBar(title: "About Us"),
      body: Center(
        child: Text("About Us"),
      ),
    );
  }
}
