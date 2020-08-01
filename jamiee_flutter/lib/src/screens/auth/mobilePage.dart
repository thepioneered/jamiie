import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/providers/auth/mobileProvider.dart';
import 'package:jamiee_flutter/src/styles/colors.dart';
import 'package:provider/provider.dart';

class MobilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var mobileProvider = Provider.of<MobileProvider>(context,);
    return Consumer<MobileProvider>(builder: (_, mobileProvider, child) {
      print("++++++++++++++Mobile Page Rebuild+++++++++++++++++");
      return Scaffold(
        key: mobileProvider.loginScaffoldKey,
        backgroundColor: AppColors.white,
        appBar: AppBar(
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
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 75.0,
            child: Column(
              children: <Widget>[
                Container(
                  constraints: const BoxConstraints(maxHeight: 340),
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/login.png"),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 40.0),
                  child: Text(
                    "Please enter your phone number",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Container(
                  height: 40,
                  constraints: const BoxConstraints(maxWidth: 500),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CupertinoTextField(
                    toolbarOptions: ToolbarOptions(
                      copy: false,
                      cut: false,
                      selectAll: false,
                      paste: false,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryColorLight),
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    maxLength: 10,
                    controller: mobileProvider.mobileController,
                    clearButtonMode: OverlayVisibilityMode.editing,
                    keyboardType: TextInputType.phone,
                    maxLines: 1,
                    placeholder: '+1...',
                  ),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    constraints: const BoxConstraints(maxWidth: 150),
                    child: mobileProvider.onceClicked
                        ? mobileProvider.sendOtpButton(
                            loader: true, onTap: () {})
                        : mobileProvider.sendOtpButton(
                            loader: false,
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              mobileProvider.mobileNumberCheck(context);
                            },
                          )),
              ],
            ),
          ),
        ),
      );
    });
  }
}
