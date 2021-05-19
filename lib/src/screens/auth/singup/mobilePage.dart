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
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      
      ScreenUtil.init(context,
          width: 411, height: 683, allowFontScaling: false);

      return WillPopScope(
        onWillPop: () => appConfirmRemoveScreenDialog(context),
        child: Scaffold(
          key: mobileProvider.mobileScaffoldKey,
          backgroundColor: AppColors.white,
          appBar: AppBarWidget.getAppBar(context, '', isRegistration: true),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              height: 0.5.hp,
              child: Column(
                children: <Widget>[
                  //Takes 20 percent of total space
                  PageHeading.topHeading(
                      height: 0.2.hp,
                      title: SignUpFlowText.mobilePageTitle,
                      subTitle: SignUpFlowText.mobilePageSubTitle),
                  SizedBox(
                    height: 10.h,
                  ),
                  Form(
                    key: mobileProvider.mobileFormKey,
                    // ignore: deprecated_member_use
                    autovalidate: mobileProvider.pageModel.onceFormSubmitted,
                    child: AppTextField.screenTextField(
                        textInputType: TextInputType.number,
                        height: 75.h,
                        hintText: "Mobile",
                        validator: TextFieldValidation.mobileValidation,
                        autoValidate: false,
                        onSaved: (String e) =>
                            mobileProvider.mobileModel.setMobile(e),
                        prefixIcon: Icons.phone),
                  ),
                  SizedBox(
                    height: 5.0.h,
                  ),
                  //8 percent of total space
                  Container(
                    height: 0.07.hp,
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
