import 'package:Jamiie/src/repositry/textConst.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      child: ForgotPasswordWidget(),
    );
  }
}

class ForgotPasswordWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 411, height: 683, allowFontScaling: false);

    return Consumer<ForgotPasswordProvider>(
      builder: (_, forgotPasswordProvider, child) {
        return Scaffold(
          key: forgotPasswordProvider.forgotPasswordScaffoldKey,
          backgroundColor: AppColors.white,
          appBar: AppBarWidget.getAppBar(context, '', isRegistration: false),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              height: 0.5.hp,
              child: Column(
                children: <Widget>[
                  PageHeading.topHeading(
                    height: 0.2.hp,
                    title: ForgotPasswordFlowText.mobilePageTitle,
                    subTitle: ForgotPasswordFlowText.mobilePageSubTitle,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Form(
                    key: forgotPasswordProvider.forgotPasswordFormKey,
                    // ignore: deprecated_member_use
                    autovalidate:
                        forgotPasswordProvider.pageModel.onceFormSubmitted,
                    child: Column(
                      children: <Widget>[
                        AppTextField.screenTextField(
                          textInputType: TextInputType.number,
                          height: 75.h,
                          prefixIcon: Icons.phone,
                          hintText: "Mobile",
                          validator: TextFieldValidation.mobileValidation,
                          autoValidate: false,
                          onSaved: (String e) =>
                              forgotPasswordProvider.mobileModel.setMobile(e),
                        ),
                        SizedBox(
                          height: 5.0.h,
                        ),
                        Container(
                          height: 0.07.hp,
                          child: forgotPasswordProvider.sendOtpButton(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              forgotPasswordProvider.forgotPassword();
                            },
                          ),
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
    );
  }
}
