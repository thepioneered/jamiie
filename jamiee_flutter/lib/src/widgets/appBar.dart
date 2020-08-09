import 'package:flutter/material.dart';
import '../styles/colors.dart';

class AppBarWidget {
  static AppBar getAppBar(BuildContext ctx, String title,
      {@required bool isRegistration}) {
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
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "No",
                style: TextStyle(color: AppColors.primaryColorLight),
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
