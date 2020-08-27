import 'package:Jamiie/src/repositry/textConst.dart';
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

class MobilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MobileProvider(),
      child: MobilePageWidget(),
    );
  }
}

class MobilePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MobileProvider>(builder: (_, mobileProvider, child) {
      print("++++++++++++++Mobile Page Rebuild+++++++++++++++++");
      double height = MediaQuery.of(context).size.height - 75.0;
      print(height);
      return WillPopScope(
        onWillPop: () => appConfirmRemoveScreenDialog(context),
        child: Scaffold(
          key: mobileProvider.mobileScaffoldKey,
          backgroundColor: AppColors.white,
          appBar: AppBarWidget.getAppBar(context, '', isRegistration: true),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              height: height / 2,
              child: Column(
                children: <Widget>[
                  //Takes 20 percent of total space
                  PageHeading.topHeading(
                      height: height,
                      title: SignUpFlowText.mobilePageTitle,
                      subTitle: SignUpFlowText.mobilePageSubTitle),
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
                  SizedBox(
                    height: 5.0,
                  ),
                  //8 percent of total space
                  Container(
                    height: height * 0.07,
                    child: mobileProvider.sendOtpButton(
                          
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
