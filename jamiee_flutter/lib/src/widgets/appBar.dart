import 'package:flutter/material.dart';
import '../styles/colors.dart';

class AppBarWidget {
  static AppBar getAppBar(BuildContext ctx, String title) {
    return AppBar(
      centerTitle: true,
      //TODO:Style pending
      title: Text(title, style: TextStyle(color: AppColors.primaryColorPurple)),
      leading: IconButton(
        icon: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: AppColors.primaryColorLight.withAlpha(20),
          ),
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColorPurple,
            size: 16,
          ),
        ),
        onPressed: () => Navigator.of(ctx).pop(),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      brightness: Brightness.light,
    );
  }
}
