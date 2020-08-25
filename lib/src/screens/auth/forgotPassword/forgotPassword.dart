import 'package:Jamiie/src/repositry/textConst.dart';

import '../../../utils/validationRegex.dart';
import '../../../widgets/pageHeading.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../widgets/appTextFields/appTextField.dart';
import '../../../providers/auth/forgotPassword/FPmobileProvider.dart';
import '../../../styles/colors.dart';
import '../../../widgets/appBar.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForgotPasswordProvider(),
      child: Consumer<ForgotPasswordProvider>(
        builder: (_, forgotPasswordProvider, child) {
          double height = MediaQuery.of(context).size.height - 75.0;
          return Scaffold(
            key: forgotPasswordProvider.forgotPasswordScaffoldKey,
            backgroundColor: AppColors.white,
            appBar: AppBarWidget.getAppBar(context, '', isRegistration: false),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                height: MediaQuery.of(context).size.height - 75.0,
                child: Column(
                  children: <Widget>[
                    //20 percent of total height
                    PageHeading.topHeading(
                        height: height,
                        title: ForgotPasswordFlowText.mobilePageTitle,
                        subTitle: ForgotPasswordFlowText.mobilePageSubTitle),
                    Form(
                      key: forgotPasswordProvider.forgotPasswordFormKey,
                      autovalidate:
                          forgotPasswordProvider.pageModel.onceFormSubmitted,
                      child: Column(
                        children: <Widget>[
                          AppTextField.screenTextField(
                            textInputType: TextInputType.number,
                            maxLength: 10,
                            prefixIcon: Icons.phone,
                            hintText: "Mobile",
                            validator: TextFieldValidation.mobileValidation,
                            autoValidate: false,
                            onSaved: (String e) =>
                                forgotPasswordProvider.mobileModel.setMobile(e),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            height: height * 0.08,
                            child: forgotPasswordProvider.sendOtpButton(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  forgotPasswordProvider.forgotPassword();
                                },
                                loader: false),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
