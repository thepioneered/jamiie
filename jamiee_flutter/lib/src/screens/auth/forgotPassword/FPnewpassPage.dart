import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/auth/forgotPassword/FPnewPasswordProvider.dart';
import '../../../styles/colors.dart';
import '../../../utils/validationRegex.dart';
import '../../../widgets/appBar.dart';
import '../../../widgets/appTextFields/appTextField.dart';
import '../../../widgets/pageHeading.dart';

class NewPasswordPage extends StatefulWidget {
  @override
  _NewPasswordPageState createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
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
    return ChangeNotifierProvider(
      create: (context) => NewPasswordProvider(),
      child: Consumer<NewPasswordProvider>(
        builder: (_, newPasswordProvider, child) {
          return Scaffold(
            key: newPasswordProvider.newpassScaffoldKey,
            appBar: AppBarWidget.getAppBar(context, '', isRegistration: false),
            backgroundColor: AppColors.white,
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: <Widget>[
                    PageHeading.topHeading(
                        title: "New Password",
                        subTitle: "Enter your new password."),
                    Form(
                      key: newPasswordProvider.newpassFormKey,
                      autovalidate:
                          newPasswordProvider.pageModel.onceFormSubmitted,
                      child: Column(
                        children: [
                          AppTextField.screenTextField(
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
                              focusNode: confirmNode,
                              hintText: "Confrim Password",
                              showPassword: false,
                              validator:
                                  newPasswordProvider.confirmPasswordValidation,
                              autoValidate: false,
                              onSaved: (e) => newPasswordProvider
                                  .newPasswordModel
                                  .setPassword(e),
                              prefixIcon: Icons.lock),
                          newPasswordProvider.pageModel.onceClicked
                              ? newPasswordProvider.updatePasswordButton(
                                  true, () {})
                              : newPasswordProvider.updatePasswordButton(false,
                                  () {
                                  FocusScope.of(context).unfocus();
                                  newPasswordProvider.updateNewPassword();
                                }),
                        ],
                      ),
                    )
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
