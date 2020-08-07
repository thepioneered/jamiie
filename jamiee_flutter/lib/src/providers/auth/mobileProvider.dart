import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../server/endpoint.dart';
import '../../server/networkCalls.dart';
import '../../styles/colors.dart';
import '../../utils/validationRegex.dart';

class MobileProvider extends ChangeNotifier {
  bool onceClicked;
  TextEditingController mobileController = TextEditingController();
  GlobalKey<ScaffoldState> loginScaffoldKey = GlobalKey<ScaffoldState>();
  static String mobile;

  MobileProvider() {
    onceClicked = false;
  }

  void setOnceClicked() {
    onceClicked = false;
    notifyListeners();
  }

  dis() {
    print("till here");
    mobileController.clear();
  }

  Widget sendOtpButton({@required Function onTap, @required bool loader}) {
    return loader
        ? Center(child: CupertinoActivityIndicator())
        : RaisedButton(
            onPressed: onTap,
            color: AppColors.primaryColorPurple,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14))),
            child: Container(
              width: 100.0,
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: AppColors.primaryColorLight,
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16,
                    ),
                  )
                ],
              ),
            ),
          );
  }

  void mobileNumberCheck(BuildContext ctx) async {
    onceClicked = true;
    notifyListeners();
    mobile = mobileController.text;

    if (mobile == null || mobile == "") {
      loginScaffoldKey.currentState.showSnackBar(
        snackBar(
            title: "Please enter mobile number.",
            backgroundColor: AppColors.red,
            textColor: AppColors.white),
      );
      onceClicked = false;
      notifyListeners();
    } else {
      if (!AppRegularExpression.mobileRegExp.hasMatch(mobile)) {
        loginScaffoldKey.currentState.showSnackBar(
          snackBar(
              title: "Please enter valid mobile number.",
              backgroundColor: AppColors.red,
              textColor: AppColors.white),
        );
        onceClicked = false;
        notifyListeners();
      } else {
        mobile = '+91$mobile';
        Map<String, dynamic> body = await NetworkCalls.postDataToServer(
            key: loginScaffoldKey,
            endPoint: EndPoints.sendOtp,
            afterRequest: () {},
            //TODO
            body: {"phone": "${mobile.toString()}"});
        onceClicked = false;

        notifyListeners();
        print(body["status"]);

        if (body["status"] == true) {
          mobileController.clear();
          Navigator.pushNamed(ctx, "/OtpPage");
        }
        // var body = json.encode({"otp": mobile});
        // await http.post(
        //   "https://desolate-stream-61233.herokuapp.com/otp",
        //   body: body,
        //   headers: {
        //     "Content-Type": "application/json",
        //   },
        // ).then((value) {
        //   onceClicked = false;
        //   notifyListeners();
        //   if (value.statusCode == 501) {
        //     loginScaffoldKey.currentState.showSnackBar(
        //       snackBar(
        //           title: "You have been blocked",
        //           backgroundColor: AppColors.red,
        //           textColor: AppColors.white),
        //     );
        //   } else if (value.statusCode == 200) {
        //     Navigator.pushNamed(ctx, "/OtpPage");
        //   }
        // });
      }
    }
  }

  SnackBar snackBar(
      {@required String title,
      @required Color backgroundColor,
      @required Color textColor}) {
    return SnackBar(
      duration: Duration(milliseconds: 1200),
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      content: Text(title, style: TextStyle(color: textColor)),
    );
  }
}
