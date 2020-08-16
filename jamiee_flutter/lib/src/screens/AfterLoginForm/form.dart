import 'package:Jamiie/src/repositry/afterLoginForm.dart';
import 'package:Jamiie/src/widgets/pageHeading.dart';
import 'package:flutter/material.dart';
import '../../providers/AfterLoginForm/afterLoginFormProvider.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              children: [
                PageHeading.topHeading(
                    title: "Few more details",
                    subTitle:
                        "Please enter few more details and your are ready to go."),
                Form(
                  key: formProvider.formKey,
                  autovalidate: formProvider.pageModel.onceFormSubmitted,
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
                        autoValidate: false,
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
                        autoValidate: false,
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
                        autoValidate: false,
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
                        autoValidate: false,
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
                        autoValidate: false,
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
                      formProvider.pageModel.onceClicked
                          ? AppButton.loginButton(
                              loader: true,
                              onTap: () => {},
                            )
                          : AppButton.loginButton(
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
