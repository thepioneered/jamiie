import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/providers/AfterLoginForm/formProvider.dart';
import 'package:jamiee_flutter/src/styles/colors.dart';
import 'package:jamiee_flutter/src/styles/text.dart';
import 'package:jamiee_flutter/src/widgets/AfterLoginForm/formwidget.dart';
import 'package:jamiee_flutter/src/widgets/appBar.dart';
import 'package:jamiee_flutter/src/widgets/button/appButton.dart';
import 'package:provider/provider.dart';

class AfterLoginFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formProvider = Provider.of<FormProvider>(context);

    return Scaffold(
      key: formProvider.scaffoldKey,
      // backgroundColor: AppColors.white,
      // appBar: AppBarWidget.getAppBar(context, "", isRegistration: true),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Enter Your Details',
                style: AppTextStyle.topHeading,
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Job Age :',
                    style: AppTextStyle.subheadingTextForm,
                  ),
                  SizedBox(height: 5),
                  OurDropdown.dropdown(
                    items: [
                      'upto 1 year',
                      'upto 2 years',
                      'upto 3 years',
                      'upto 4 years'
                    ],
                    onchanged: (e) {
                      formProvider.listModel.data1 = e;
                      formProvider.callListners();
                    },
                    value: formProvider.listModel.data1,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Family :',
                    style: AppTextStyle.subheadingTextForm,
                  ),
                  SizedBox(height: 5),
                  OurDropdown.dropdown(
                    items: [
                      'Single no children',
                      'Single with children',
                      'Stable relation or marriage with no children',
                      'Stable relation or marriage with children'
                    ],
                    onchanged: (e) {
                      formProvider.listModel.data2 = e;
                      formProvider.callListners();
                    },
                    value: formProvider.listModel.data2,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Age :',
                    style: AppTextStyle.subheadingTextForm,
                  ),
                  SizedBox(height: 5),
                  OurDropdown.dropdown(
                    items: ['<20 years', '<25 years', '<30 years', '>35 years'],
                    onchanged: (e) {
                      formProvider.listModel.data3 = e;
                      formProvider.callListners();
                    },
                    value: formProvider.listModel.data3,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Saving Money since how many Years :',
                    style: AppTextStyle.subheadingTextForm,
                  ),
                  SizedBox(height: 5),
                  OurDropdown.dropdown(
                    items: ['<1', '1-2', '2-3', '>3'],
                    onchanged: (e) {
                      formProvider.listModel.data4 = e;
                      formProvider.callListners();
                    },
                    value: formProvider.listModel.data4,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'How Many loans you have :',
                    style: AppTextStyle.subheadingTextForm,
                  ),
                  SizedBox(height: 5),
                  OurDropdown.dropdown(
                    items: ['>3', '3', '2', '1'],
                    onchanged: (e) {
                      formProvider.listModel.data5 = e;
                      formProvider.callListners();
                    },
                    value: formProvider.listModel.data5,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Living in USA since :',
                    style: AppTextStyle.subheadingTextForm,
                  ),
                  SizedBox(height: 5),
                  OurDropdown.dropdown(
                    items: ['1', '2', '3', '>3'],
                    onchanged: (e) {
                      formProvider.listModel.data6 = e;
                      formProvider.callListners();
                    },
                    value: formProvider.listModel.data6,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "How many accounts linked(google, fb, twitter, linkdn) :",
                    style: AppTextStyle.subheadingTextForm,
                  ),
                  SizedBox(height: 5),
                  OurDropdown.dropdown(
                    items: ['1', '2', '3', '4'],
                    onchanged: (e) {
                      formProvider.listModel.data7 = e;
                      formProvider.callListners();
                    },
                    value: formProvider.listModel.data7,
                  ),
                  SizedBox(height: 30),
                  AppButton.loginButton(
                    loader: false,
                    title: 'Submit',
                    onTap: () => formProvider.onPressed(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
