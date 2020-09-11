import 'package:Jamiie/src/widgets/loaderDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../server/endpoint.dart';
import '../../server/networkCalls.dart';
import '../../utils/sharedPref.dart';
import '../../widgets/settings/logoutDialog.dart';

class LogoutProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> settingScaffoldKey = GlobalKey<ScaffoldState>();

  String mobile;

  void handleLogout() {
    appLogoutDialog(
      settingScaffoldKey.currentContext,
      () async {
        Navigator.pop(settingScaffoldKey.currentContext);
        try {
          LoaderDialog.loaderDialog(settingScaffoldKey.currentContext);
        } catch (e) {
          print("Error At Logout Provider in Loader Dialog!");
          throw Exception(e);
        }
        print(await LocalStorage.getMobile());
        print(await LocalStorage.getToken());
        print(EndPoints.ipAddress + EndPoints.userlogout);
        Map<String, dynamic> body = await NetworkCalls.postDataToServer(
          key: settingScaffoldKey,
          endPoint: EndPoints.userlogout,
          authRequest: true,
          afterRequest: () {},
          body: {
            "phone": await LocalStorage.getMobile(),
          },
        );

        if (body["status"]) {
          await LocalStorage.deleteData();
          Navigator.pop(settingScaffoldKey.currentContext);
          Navigator.pushNamedAndRemoveUntil(
            settingScaffoldKey.currentContext,
            "/LoginPage",
            (route) => false,
          );
        }
      },
    );
  }
}

//TODO: 401 pe agr logout end point hai to clear krdo state ko
