import 'package:Jamiie/src/utils/validationRegex.dart';
import 'package:Jamiie/src/widgets/appTextFields/appTextField.dart';
import 'package:Jamiie/src/widgets/button/appButton.dart';
import 'package:Jamiie/src/widgets/pageHeading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AfterLoginFormPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AfterLoginFormWidget2();
  }
}

class AfterLoginFormWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Column(
            children: [
              PageHeading.topHeading(
                  title: "Complete your profile",
                  subTitle:
                      "Please enter the required details to complete your profile."),
              AppTextField.screenTextField(
                maxLines: 3,
                textInputType: TextInputType.multiline,
                hintText: "Address",
                edge: EdgeInsets.symmetric(vertical:10.0,horizontal: 10.0),
                validator: (w) {
                  if (w.isEmpty) {
                    return "Empty";
                  } else {
                    return null;
                  }
                },
                autoValidate: false,
                onSaved: (e) {
                  print(e);
                },
                prefixIcon: null,
              ),
              SizedBox(height: 30.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width - 50.0) / 2,
                    child: AppTextField.screenTextField(
                      edge: EdgeInsets.only(left:10.0),
                      toolbarOptions: ToolbarOptions(
                          copy: false,
                          paste: false,
                          cut: false,
                          selectAll: false),
                      textInputType: TextInputType.number,
                      hintText: "Select DOB",
                      autoValidate: false,
                      autofocus: false,
                      validator: TextFieldValidation.socialNumber,
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width - 50.0) / 2,
                    child: AppTextField.screenTextField(
                      edge: EdgeInsets.only(left:10.0),
                      toolbarOptions: ToolbarOptions(
                          copy: false,
                          paste: false,
                          cut: false,
                          selectAll: false),
                      textInputType: TextInputType.number,
                      hintText: "How long at this address",
                      autoValidate: false,
                      autofocus: false,
                      validator: TextFieldValidation.socialNumber,
                    ),
                  ),
                ],
              ),
              AppTextField.screenTextField(
                toolbarOptions: ToolbarOptions(
                    copy: false, paste: false, cut: false, selectAll: false),
                prefixIcon: FontAwesomeIcons.shieldAlt,
                textInputType: TextInputType.number,
                maxLength: 4,
                hintText: "Last 4 digits of SSN",
                autoValidate: false,
                autofocus: false,
                validator: TextFieldValidation.socialNumber,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width - 50.0) / 2,
                    child: AppTextField.screenTextField(
                      edge: EdgeInsets.only(left:10.0),
                      toolbarOptions: ToolbarOptions(
                          copy: false,
                          paste: false,
                          cut: false,
                          selectAll: false),
                      textInputType: TextInputType.number,
                      hintText: "Employer name",
                      autoValidate: false,
                      autofocus: false,
                      validator: TextFieldValidation.socialNumber,
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width - 50.0) / 2,
                    child: AppTextField.screenTextField(
                      edge: EdgeInsets.only(left:10.0),
                      toolbarOptions: ToolbarOptions(
                          copy: false,
                          paste: false,
                          cut: false,
                          selectAll: false),
                      textInputType: TextInputType.number,
                      hintText: "How long working with this employer",
                      autoValidate: false,
                      autofocus: false,
                      validator: TextFieldValidation.socialNumber,
                    ),
                  ),
                ],
              ),
              AppButton.loginButton(
                loader: false,
                onTap: () {},
                title: "Save Details",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
