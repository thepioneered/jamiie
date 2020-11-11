import 'package:Jamiie/src/styles/colors.dart';
import 'package:Jamiie/src/widgets/appBar.dart';
import 'package:flutter/material.dart';

class LoanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget.getAppBar(context, '', isRegistration: false),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        child: Column(
          children: [
            Container(
              color: Colors.red[200],
              height: 300,
            )
          ],
        ),
      ),
    );
  }
}
