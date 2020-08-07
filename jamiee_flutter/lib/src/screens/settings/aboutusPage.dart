import 'package:flutter/material.dart';
import '../../widgets/appBar.dart';

class AboutusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.getAppBar(context, "About Us"),
      body: Center(
        child: Text("About Us"),
      ),
    );
  }
}
