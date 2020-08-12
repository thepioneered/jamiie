import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../server/endpoint.dart';
import '../../server/networkCalls.dart';
import '../../utils/sharedPref.dart';
import '../../widgets/settings/logoutDialog.dart';

class LogoutProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> settingScaffoldKey = GlobalKey<ScaffoldState>();

  String mobile;
  void _onLoading(BuildContext ctx) {
    showDialog(
      context: ctx,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            height: 75.0,
            width: 40.0,
            child: CupertinoActivityIndicator(),
          ),
        );
      },
    );
  }

  void handleLogout() async {
    appLogoutDialog(
      settingScaffoldKey.currentContext,
      () async {
        Navigator.pop(settingScaffoldKey.currentContext);
        _onLoading(settingScaffoldKey.currentContext);
        String mobile = await LocalStorage().getMobile();
        Map<String, dynamic> body = await NetworkCalls.postDataToServer(
            key: settingScaffoldKey,
            endPoint: EndPoints.userlogout,
            afterRequest: () {},
            body: {"phone": mobile});

        if (body["status"]) {
          await LocalStorage().deleteData();
          Navigator.pushNamedAndRemoveUntil(settingScaffoldKey.currentContext,
              "/LoginPage", (route) => false);
        } else {
          Navigator.pop(settingScaffoldKey.currentContext);
        }
      },
    );
  }
}
