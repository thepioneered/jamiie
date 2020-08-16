import 'package:Jamiie/src/repositry/afterLoginForm.dart';
import 'package:flutter/material.dart';
import '../../providers/AfterLoginForm/afterLoginForm.dart';
import '../../styles/text.dart';
import '../../widgets/AfterLoginForm/formwidget.dart';
import '../../widgets/button/appButton.dart';
import 'package:provider/provider.dart';

class AfterLoginFormPage extends StatefulWidget {
  @override
  _AfterLoginFormPageState createState() => _AfterLoginFormPageState();
}

class _AfterLoginFormPageState extends State<AfterLoginFormPage> {
  @override
  Widget build(BuildContext context) {
    try {
      var formProvider = Provider.of<AfterLoginFormProvider>(context);
      return Scaffold(
        key: formProvider.scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                Text(
                  'Enter Your Details',
                  style: AppTextStyle.topHeading,
                ),
                SizedBox(height: 20),
                Form(
                  key: formProvider.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Job Age :', style: AppTextStyle.subheadingTextForm),
                      OurDropdown.dropdown(
                        items: AfterLoginDataRepo.one,
                        onchanged: (e) {
                          formProvider.listModel.data1 = e;
                          formProvider.callListners();
                        },
                        value: formProvider.listModel.data1,
                        validator: formProvider.validator,
                        autoValidate: formProvider.autoValidate,
                      ),
                      Text('Family :', style: AppTextStyle.subheadingTextForm),
                      OurDropdown.dropdown(
                        items: AfterLoginDataRepo.two,
                        onchanged: (e) {
                          formProvider.listModel.data2 = e;
                          formProvider.callListners();
                        },
                        value: formProvider.listModel.data2,
                        validator: formProvider.validator,
                        autoValidate: formProvider.autoValidate,
                      ),
                      Text('Age :', style: AppTextStyle.subheadingTextForm),
                      OurDropdown.dropdown(
                        items: AfterLoginDataRepo.three,
                        onchanged: (e) {
                          formProvider.listModel.data3 = e;
                          formProvider.callListners();
                        },
                        value: formProvider.listModel.data3,
                        validator: formProvider.validator,
                        autoValidate: formProvider.autoValidate,
                      ),
                      Text('Saving Money since how many Years :',
                          style: AppTextStyle.subheadingTextForm),
                      OurDropdown.dropdown(
                        items: AfterLoginDataRepo.four,
                        onchanged: (e) {
                          formProvider.listModel.data4 = e;
                          formProvider.callListners();
                        },
                        value: formProvider.listModel.data4,
                        validator: formProvider.validator,
                        autoValidate: formProvider.autoValidate,
                      ),
                      Text('How Many loans you have :',
                          style: AppTextStyle.subheadingTextForm),
                      OurDropdown.dropdown(
                        items: AfterLoginDataRepo.five,
                        onchanged: (e) {
                          formProvider.listModel.data5 = e;
                          formProvider.callListners();
                        },
                        value: formProvider.listModel.data5,
                        validator: formProvider.validator,
                        autoValidate: formProvider.autoValidate,
                      ),
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
                        autoValidate: formProvider.autoValidate,
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
                      AppButton.loginButton(
                        loader: false,
                        title: 'Submit',
                        onTap: () => formProvider.onPressed(),
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
