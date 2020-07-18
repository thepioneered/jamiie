import 'package:flutter/material.dart';
import '../../styles/colors.dart';


class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: BackButton(
          color: AppColors.black,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Text("CONTACT WILL BE DONE"),
      ),
    );
  }
}