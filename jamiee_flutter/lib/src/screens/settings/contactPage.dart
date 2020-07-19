import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/widgets/settings/appBar.dart';
import '../../styles/colors.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsAppBar(
        title: "Contact",
      ),
      body: Center(
        child: Text("CONTACT WILL BE DONE"),
      ),
    );
  }
}
