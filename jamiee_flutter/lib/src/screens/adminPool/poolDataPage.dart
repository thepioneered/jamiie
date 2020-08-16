import 'package:flutter/material.dart';
import '../../styles/colors.dart';
import '../../widgets/appBar.dart';

class PoolDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBarWidget.getAppBar(context, '', isRegistration: false),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
      ),
    );
  }
}
