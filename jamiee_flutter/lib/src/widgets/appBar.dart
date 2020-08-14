import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/styles/text.dart';
import '../styles/colors.dart';

class AppBarWidget {
  static AppBar getAppBar(BuildContext ctx, String title,
      {@required bool isRegistration}) {
    return AppBar(
      centerTitle: true,
      title: Text(title, style: AppTextStyle.appBarTitle),
      leading: IconButton(
        icon: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: AppColors.primaryColorPurple.withAlpha(20),
          ),
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColorPurple,
            size: 16,
          ),
        ),
        onPressed: isRegistration
            ? () => AppBarWidget.appConfirmRemoveScreenDialog(ctx)
            : () => Navigator.of(ctx).pop(),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      brightness: Brightness.light,
    );
  }

  static void appConfirmRemoveScreenDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          actionsPadding: EdgeInsets.only(right: 5.0),
          title: Text(
            "Are you sure you want to cancel Registration?",
            style: AppTextStyle.dialogTitle,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "No",
                style: AppTextStyle.dialogButton(AppColors.black),
              ),
              onPressed: () {
                Navigator.pop(ctx);
                return false;
              },
            ),
            FlatButton(
              color: AppColors.primaryColorPurple,
              child: Text(
                "Yes",
                style: AppTextStyle.dialogButton(AppColors.white),
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/LoginPage", (route) => false);
              },
            ),
          ],
        );
      },
    );
  }
}
