import 'package:Jamiie/src/repositry/afterLoginForm.dart';
import 'package:Jamiie/src/utils/icons.dart';
import 'package:Jamiie/src/utils/validationRegex.dart';
import 'package:Jamiie/src/widgets/appTextFields/appTextField.dart';
import 'package:Jamiie/src/widgets/pageHeading.dart';
import 'package:flutter/material.dart';
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
      double height = MediaQuery.of(context).size.height - 75.0;
      return Scaffold(
        key: formProvider.scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              children: [
                PageHeading.topHeading(
                    height: height,
                    title: "Few more details",
                    subTitle:
                        "Please enter few more details and your are ready to go."),
                Form(
                  key: formProvider.formKey,
                  autovalidate: formProvider.pageModel.onceFormSubmitted,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Marital Status :',
                          style: AppTextStyle.subheadingTextForm),
                      OurDropdown.dropdown(
                        items: AfterLoginDataRepo.one,
                        onchanged: (e) {
                          formProvider.listModel.data1 = e;
                          formProvider.callListners();
                        },
                        value: formProvider.listModel.data1,
                        validator: formProvider.validator,
                        autoValidate: false,
                      ),
                      Text(
                        'How many times you have pooled money ?',
                        style: AppTextStyle.subheadingTextForm,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      AppTextField.screenTextField(
                        toolbarOptions: ToolbarOptions(paste: false),
                        textInputType: TextInputType.number,
                        hintText: "",
                        validator: TextFieldValidation.numberValidation,
                        autoValidate: false,
                        onSaved: (value) {},
                        prefixIcon: null,
                      ),
                      
                      Text('Total Debt ?',
                          style: AppTextStyle.subheadingTextForm),
                      SizedBox(
                        height: 5.0,
                      ),
                      AppTextField.screenTextField(
                        toolbarOptions: ToolbarOptions(paste: false),
                        textInputType: TextInputType.number,
                        hintText: "",
                        validator: TextFieldValidation.numberValidation,
                        autoValidate: false,
                        onSaved: null,
                        prefixIcon: AppIcons.dollarIcon,
                      ),
                      // Text('Age :', style: AppTextStyle.subheadingTextForm),
                      // OurDropdown.dropdown(
                      //   items: AfterLoginDataRepo.three,
                      //   onchanged: (e) {
                      //     formProvider.listModel.data3 = e;
                      //     formProvider.callListners();
                      //   },
                      //   value: formProvider.listModel.data3,
                      //   validator: formProvider.validator,
                      //   autoValidate: false,
                      // ),
                      // Text('Saving Money since how many Years :',
                      //     style: AppTextStyle.subheadingTextForm),
                      // OurDropdown.dropdown(
                      //   items: AfterLoginDataRepo.four,
                      //   onchanged: (e) {
                      //     formProvider.listModel.data4 = e;
                      //     formProvider.callListners();
                      //   },
                      //   value: formProvider.listModel.data4,
                      //   validator: formProvider.validator,
                      //   autoValidate: false,
                      // ),
                      // Text('How Many loans you have :',
                      //     style: AppTextStyle.subheadingTextForm),
                      // OurDropdown.dropdown(
                      //   items: AfterLoginDataRepo.five,
                      //   onchanged: (e) {
                      //     formProvider.listModel.data5 = e;
                      //     formProvider.callListners();
                      //   },
                      //   value: formProvider.listModel.data5,
                      //   validator: formProvider.validator,
                      //   autoValidate: false,
                      // ),
                      Text('Living in USA since :',
                          style: AppTextStyle.subheadingTextForm),
                      OurDropdown.dropdown(
                        items: AfterLoginDataRepo.six,
                        onchanged: (e) {
                          formProvider.listModel.data6 = e;
                          formProvider.callListners();
                        },
                        value: formProvider.listModel.data6,
                        validator: formProvider.validator,
                        autoValidate: false,
                      ),
                      // Text(
                      //     "How many accounts linked(google, fb, twitter, linkdn) :",
                      //     style: AppTextStyle.subheadingTextForm),
                      // OurDropdown.dropdown(
                      //   items: ['1', '2', '3', '4'],
                      //   onchanged: (e) {
                      //     formProvider.listModel.data7 = e;
                      //     formProvider.callListners();
                      //   },
                      //   value: formProvider.listModel.data7,
                      //   validator: formProvider.validator,
                      //   autoValidate: formProvider.autoValidate,
                      // ),
                      Container(
                        height: height * 0.08,
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
