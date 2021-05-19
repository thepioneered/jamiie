import 'package:Jamiie/src/repositry/afterLoginForm.dart';
import 'package:Jamiie/src/widgets/pageHeading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../providers/auth/afterLoginFormProvider.dart';
import '../../../styles/text.dart';
import '../../../widgets/AfterLoginForm/formwidget.dart';
import '../../../widgets/button/appButton.dart';
import 'package:provider/provider.dart';

class AfterLoginFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AfterLoginFormProvider(),
      child: AfterLoginFormWidget(),
    );
  }
}

class AfterLoginFormWidget extends StatefulWidget {
  @override
  _AfterLoginFormWidgetState createState() => _AfterLoginFormWidgetState();
}

class _AfterLoginFormWidgetState extends State<AfterLoginFormWidget> {
  @override
  Widget build(BuildContext context) {
    try {
      var formProvider = Provider.of<AfterLoginFormProvider>(context);
      ScreenUtil.init(context,
          width: 411, height: 683, allowFontScaling: false);

      return Scaffold(
        key: formProvider.scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
            child: Column(
              children: [
                PageHeading.topHeading(
                    title: "Few more details",
                    subTitle:
                        "Please enter few more details and your are ready to go."),
                Form(
                  key: formProvider.formKey,
                  // ignore: deprecated_member_use
                  autovalidate: formProvider.pageModel.onceFormSubmitted,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Final
                      Text('Job Age:', style: AppTextStyle.subheadingTextForm),
                      SizedBox(height: 5.h),
                      OurDropdown.dropdown(
                        hint: 'Choose option',
                        iconSize: 40,
                        dropdownTextStyle: AppTextStyle.dropDownStyleForm,
                        items: AfterLoginDataRepo.jobAge,
                        onchanged: (e) {
                          formProvider.listModel.jobAge = e;
                          formProvider.callListners();
                        },
                        value: formProvider.listModel.jobAge,
                        validator: formProvider.validator,
                        autoValidate: false,
                      ),
                      Text('Family :', style: AppTextStyle.subheadingTextForm),
                      SizedBox(height: 5.h),
                      OurDropdown.dropdown(
                        hint: 'Choose option',
                        iconSize: 40,
                        dropdownTextStyle: AppTextStyle.dropDownStyleForm,
                        items: AfterLoginDataRepo.faimlyStatus,
                        onchanged: (e) {
                          formProvider.listModel.faimlyStatus = e;
                          formProvider.callListners();
                        },
                        value: formProvider.listModel.faimlyStatus,
                        validator: formProvider.validator,
                        autoValidate: false,
                      ),
                      Text('How many times pooled money :',
                          style: AppTextStyle.subheadingTextForm),
                      SizedBox(height: 5.h),
                      OurDropdown.dropdown(
                        hint: 'Choose option',
                        iconSize: 40,
                        dropdownTextStyle: AppTextStyle.dropDownStyleForm,
                        items: AfterLoginDataRepo.howManyTimesPooledMoney,
                        onchanged: (e) {
                          formProvider.listModel.howManyTimesPooledMoney = e;
                          formProvider.callListners();
                        },
                        value: formProvider.listModel.howManyTimesPooledMoney,
                        validator: formProvider.validator,
                        autoValidate: false,
                      ),
                      Text('Money Saving Goal :',
                          style: AppTextStyle.subheadingTextForm),
                      SizedBox(height: 5.h),
                      OurDropdown.dropdown(
                        hint: 'Choose option',
                        iconSize: 40,
                        dropdownTextStyle: AppTextStyle.dropDownStyleForm,
                        items: AfterLoginDataRepo.moneySavingGoal,
                        onchanged: (e) {
                          formProvider.listModel.moneySavingGoal = e;
                          formProvider.callListners();
                        },
                        value: formProvider.listModel.moneySavingGoal,
                        validator: formProvider.validator,
                        autoValidate: false,
                      ),

                      Container(
                        height: 0.07.hp,
                        child: AppButton.loginButton(
                          title: 'Submit',
                          onTap: () => formProvider.onPressed(),
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
    } catch (e) {
      print(e);
      return null;
    }
  }
}
