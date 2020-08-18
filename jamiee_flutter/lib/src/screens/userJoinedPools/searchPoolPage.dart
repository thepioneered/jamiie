import 'package:Jamiie/src/utils/validationRegex.dart';

import '../../providers/userJoinedPools/searchPoolProvider.dart';
import '../../widgets/appBar.dart';
import '../../widgets/appTextFields/appTextField.dart';
import '../../widgets/button/appButton.dart';
import '../../widgets/pageHeading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../styles/colors.dart';

class SearchPoolPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchPoolProvider(),
      child: SearchPoolPageWidget(),
    );
  }
}

class SearchPoolPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchPoolProvider = Provider.of<SearchPoolProvider>(context);
    return Scaffold(
      key: searchPoolProvider.searchPoolPageScaffoldKey,
      appBar: AppBarWidget.getAppBar(context, '', isRegistration: false),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Column(
            children: [
              PageHeading.topHeading(
                  title: "Search Pool",
                  subTitle: "Enter pool id to get pool details."),
              Form(
                key: searchPoolProvider.searchPoolPageFormKey,
                autovalidate: searchPoolProvider.pageModel.onceFormSubmitted,
                child: Column(
                  children: [
                    AppTextField.screenTextField(
                        maxLength: 8,
                        hintText: "Pool Id",
                        validator: TextFieldValidation.searchPoolValidation,
                        autoValidate: false,
                        onSaved: (e) =>
                            searchPoolProvider.poolIdModel.poolId = e,
                        prefixIcon: null),
                    AppButton.loginButton(
                      loader: false,
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        searchPoolProvider.searchPoolLogic();
                      },
                      title: "Search Pool",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
