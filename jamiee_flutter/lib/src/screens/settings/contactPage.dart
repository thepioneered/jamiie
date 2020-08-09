import 'package:flutter/material.dart';
import '../../widgets/appBar.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.getAppBar(context, "Contact Us",isRegistration: false),
      body: Center(
        child: Text("CONTACT WILL BE DONE"),
      ),
    );
  }
}
