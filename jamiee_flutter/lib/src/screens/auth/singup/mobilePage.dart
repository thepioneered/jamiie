import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/onWillPopScope.dart';
import '../../../utils/validationRegex.dart';
import '../../../widgets/appTextFields/appTextField.dart';
import '../../../widgets/pageHeading.dart';
import '../../../providers/auth/signup/mobileProvider.dart';
import '../../../styles/colors.dart';
import '../../../widgets/appBar.dart';

class MobilePage extends StatefulWidget {
  @override
  _MobilePageState createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MobileProvider>(builder: (_, mobileProvider, child) {
      print("++++++++++++++Mobile Page Rebuild+++++++++++++++++");
      return WillPopScope(
        onWillPop: () => appConfirmRemoveScreenDialog(context),
        child: Scaffold(
          key: mobileProvider.mobileScaffoldKey,
          backgroundColor: AppColors.white,
          appBar: AppBarWidget.getAppBar(context, '', isRegistration: true),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              height: MediaQuery.of(context).size.height - 75.0,
              child: Column(
                children: <Widget>[
                  PageHeading.topHeading(
                      title: "Create Account",
                      subTitle:
                          "Please enter your mobile number for verification."),
                  Form(
                    key: mobileProvider.mobileFormKey,
                    autovalidate: mobileProvider.pageModel.onceFormSubmitted,
                    child: AppTextField.screenTextField(
                        textInputType: TextInputType.number,
                        maxLength: 10,
                        hintText: "Mobile",
                        validator: TextFieldValidation.mobileValidation,
                        autoValidate: false,
                        onSaved: (String e) =>
                            mobileProvider.mobileModel.setMobile(e),
                        prefixIcon: Icons.phone),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: mobileProvider.pageModel.onceClicked
                        ? mobileProvider.sendOtpButton(
                            loader: true, onTap: () {})
                        : mobileProvider.sendOtpButton(
                            loader: false,
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              mobileProvider.mobileNumberCheck();
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
