import 'package:Jamiie/src/utils/validationRegex.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              PageHeading.topHeading(
                  height: 100.h,
                  title: "Search Pool",
                  subTitle: "Enter pool id to get pool details."),
              Form(
                key: searchPoolProvider.searchPoolPageFormKey,
                // ignore: deprecated_member_use
                autovalidate: searchPoolProvider.pageModel.onceFormSubmitted,
                child: Column(
                  children: [
                    AppTextField.screenTextField(
                        height: 75.h,
                        maxLength: 8,
                        hintText: "Pool Id",
                        validator: TextFieldValidation.searchPoolValidation,
                        autoValidate: false,
                        onSaved: (e) =>
                            searchPoolProvider.poolIdModel.poolId = e,
                        prefixIcon: null),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      height: 0.07.hp,
                      child: AppButton.loginButton(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          searchPoolProvider.searchPoolLogic();
                        },
                        title: "Search Pool",
                      ),
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
