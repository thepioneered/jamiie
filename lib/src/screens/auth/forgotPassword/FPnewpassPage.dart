import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../providers/auth/forgotPassword/FPnewPasswordProvider.dart';
import '../../../styles/colors.dart';
import '../../../utils/validationRegex.dart';
import '../../../widgets/appBar.dart';
import '../../../widgets/appTextFields/appTextField.dart';
import '../../../widgets/pageHeading.dart';

class NewPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewPasswordProvider(),
      child: NewPasswordWidget(),
    );
  }
}

class NewPasswordWidget extends StatefulWidget {
  @override
  _NewPasswordWidgetState createState() => _NewPasswordWidgetState();
}

class _NewPasswordWidgetState extends State<NewPasswordWidget> {
  FocusNode confirmNode;

  @override
  void initState() {
    super.initState();
    confirmNode = FocusNode();
  }

  @override
  void dispose() {
    NewPasswordProvider().dispose();
    confirmNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 411, height: 683, allowFontScaling: false);

    return Consumer<NewPasswordProvider>(
      builder: (_, newPasswordProvider, child) {
        return Scaffold(
          key: newPasswordProvider.newpassScaffoldKey,
          appBar: AppBarWidget.getAppBar(context, '', isRegistration: false),
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            child: Container(
              height: 0.8.hp,
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: <Widget>[
                  PageHeading.topHeading(
                    height: 0.2.hp,
                    title: "New Password",
                    subTitle: "Enter your new password.",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Form(
                    key: newPasswordProvider.newpassFormKey,
                    autovalidate:
                        newPasswordProvider.pageModel.onceFormSubmitted,
                    child: Column(
                      children: [
                        AppTextField.screenTextField(
                            height: 75.h,
                            onEdittingComplete: () =>
                                confirmNode.requestFocus(),
                            hintText: "Password",
                            autofocus: false,
                            showPassword: false,
                            validator: TextFieldValidation.passwordValidation,
                            autoValidate: false,
                            controller: newPasswordProvider.password,
                            onSaved: null,
                            prefixIcon: Icons.lock),
                        AppTextField.screenTextField(
                            height: 75.h,
                            focusNode: confirmNode,
                            hintText: "Confrim Password",
                            showPassword: false,
                            validator:
                                newPasswordProvider.confirmPasswordValidation,
                            autoValidate: false,
                            onSaved: (e) => newPasswordProvider
                                .newPasswordModel.password = e,
                            prefixIcon: Icons.lock),
                        SizedBox(
                          height: 5.0.h,
                        ),
                        Container(
                          height: 0.07.hp,
                          child: newPasswordProvider.updatePasswordButton(() {
                            FocusScope.of(context).unfocus();
                            newPasswordProvider.updateNewPassword();
                          }),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
