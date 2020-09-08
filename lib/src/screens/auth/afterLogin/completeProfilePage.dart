import 'package:Jamiie/src/providers/auth/completeProfileProvider.dart';
import 'package:Jamiie/src/styles/colors.dart';
import 'package:Jamiie/src/styles/text.dart';
import 'package:Jamiie/src/utils/validationRegex.dart';
import 'package:Jamiie/src/widgets/appTextFields/appTextField.dart';
import 'package:Jamiie/src/widgets/button/appButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CompleteProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CompleteProfileProvider(),
      child: CompleteProfileWidget(),
    );
  }
}

class CompleteProfileWidget extends StatefulWidget {
  @override
  _CompleteProfileWidgetState createState() => _CompleteProfileWidgetState();
}

class _CompleteProfileWidgetState extends State<CompleteProfileWidget> {
  FocusNode stateNode;
  FocusNode cityNode;
  FocusNode zipcodeNode;
  FocusNode ssnNode;
  FocusNode employerNode;
  FocusNode howLongNode;
  FocusNode addressNode;
  // List<String> _dropdownValues = ["Month", "Year"];

  @override
  void initState() {
    stateNode = FocusNode();
    cityNode = FocusNode();
    zipcodeNode = FocusNode();
    ssnNode = FocusNode();
    employerNode = FocusNode();
    howLongNode = FocusNode();
    addressNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    stateNode.dispose();
    cityNode.dispose();
    zipcodeNode.dispose();
    ssnNode.dispose();
    employerNode.dispose();
    howLongNode.dispose();
    addressNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var completeProfileProvider = Provider.of<CompleteProfileProvider>(context);
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: completeProfileProvider.completeProfileScaffoldKey,
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          // height: height,
          padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 35.0),
          child: Form(
            key: completeProfileProvider.completeProfileFormKey,
            autovalidate: completeProfileProvider.pageModel.onceFormSubmitted,
            child: Column(
              children: [
                ChangeNotifierProvider(
                  create: (context) => ImageProviderCompleteProfile(),
                  child: Consumer<ImageProviderCompleteProfile>(
                    builder: (_, imageProviderSignup, child) {
                      return Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(bottom: 30.0),
                        height: 160.0,
                        width: (MediaQuery.of(context).size.width - 30.0) / 2,
                        child: imageProviderSignup.image == null
                            ? GestureDetector(
                                onTap: imageProviderSignup.getImage,
                                child: Container(
                                  alignment: Alignment.center,
                                  // height: 120.0,/
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColorPurple,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(FontAwesomeIcons.camera,
                                      color: AppColors.white),
                                ),
                              )
                            : Container(
                                alignment: Alignment.center,
                                height: 80.0,
                                width: 80.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          FileImage(imageProviderSignup.image),
                                      fit: BoxFit.fill),
                                ),
                              ),
                      );
                    },
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width - 50.0) / 2,
                          child: AppTextField.screenTextField(
                              hintText: "Street",
                              validator: (e) =>
                                  TextFieldValidation.stateCityValidation(
                                      e, "Street"),
                              onEdittingComplete: () =>
                                  stateNode.requestFocus(),
                              autoValidate: false,
                              onSaved: (e) => completeProfileProvider
                                  .completeProfileModel.street = e,
                              prefixIcon: null),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width - 50.0) / 2,
                          child: AppTextField.screenTextField(
                              hintText: "State",
                              focusNode: stateNode,
                              onEdittingComplete: () => cityNode.requestFocus(),
                              validator: (e) =>
                                  TextFieldValidation.stateCityValidation(
                                      e, "State"),
                              autoValidate: false,
                              onSaved: (e) {
                                print(e);
                                completeProfileProvider
                                    .completeProfileModel.state = e;
                              },
                              prefixIcon: null),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width - 50.0) / 2,
                      child: AppTextField.screenTextField(
                          hintText: "City",
                          focusNode: cityNode,
                          onEdittingComplete: () => zipcodeNode.requestFocus(),
                          validator: (e) =>
                              TextFieldValidation.stateCityValidation(
                                  e, "City"),
                          autoValidate: false,
                          onSaved: (e) => completeProfileProvider
                              .completeProfileModel.city = e,
                          prefixIcon: null),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width - 50.0) / 2,
                      child: AppTextField.screenTextField(
                          hintText: "Zipcode",
                          maxLength: 5,
                          focusNode: zipcodeNode,
                          onEdittingComplete: () => addressNode.requestFocus(),
                          validator: TextFieldValidation.zipCode,
                          textInputType: TextInputType.number,
                          autoValidate: false,
                          onSaved: (e) => completeProfileProvider
                              .completeProfileModel.zipcode = e,
                          prefixIcon: null),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width - 30.0) * 0.70,
                      child: AppTextField.screenTextField(
                          textInputType: TextInputType.number,
                          maxLength: 2,
                          hintText: "How long at this address?",
                          focusNode: addressNode,
                          validator: TextFieldValidation.numberValidation,
                          autoValidate: false,
                          onSaved: (e) => completeProfileProvider
                              .completeProfileModel.howLongatAddress = e,
                          prefixIcon: null),
                    ),
                    Expanded(
                      child: Container(
                          // color: Colors.blueAccent,
                          height: 50.0,
                          alignment: Alignment.center,
                          child: Text(
                            "Months",
                            style: AppTextStyle.hintText,
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width - 50.0) / 2,
                      child: GestureDetector(
                        onTap: () {
                          completeProfileProvider.selectDate(context);
                        },
                        child: AbsorbPointer(
                          child: AppTextField.screenTextField(
                              controller: completeProfileProvider.date,
                              textInputType: TextInputType.datetime,
                              hintText: "DOB",
                              validator: (value) {
                                if (value.isEmpty) return "Select Date!";
                                return null;
                              },
                              onEdittingComplete: () => ssnNode.requestFocus(),
                              autoValidate: false,
                              onSaved: (value) => completeProfileProvider
                                  .completeProfileModel.date = value,
                              prefixIcon: null),
                        ),
                      ),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width - 50.0) / 2,
                      child: AppTextField.screenTextField(
                        hintText: "Last 4 digit of SSN",
                        maxLength: 4,
                        focusNode: ssnNode,
                        textInputType: TextInputType.number,
                        onEdittingComplete: () => employerNode.requestFocus(),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Enter SSN";
                          } else if (value.contains("-") ||
                              value.contains(",") ||
                              value.contains(".")) {
                            return "Not valid";
                          } else if (value.contains(" ")) {
                            return "Blank Spaces not allowed";
                          }
                          if (value.length != 4) {
                            return "Please enter valid SSN";
                          }
                          return null;
                        },
                        autoValidate: false,
                        onSaved: (e) => completeProfileProvider
                            .completeProfileModel.ssn = e,
                        edge: EdgeInsets.only(left: 20.0),
                        prefixIcon: null,
                      ),
                    ),
                  ],
                ),
                AppTextField.screenTextField(
                    hintText: "Employer Name",
                    onEdittingComplete: () => howLongNode.requestFocus(),
                    focusNode: employerNode,
                    validator: TextFieldValidation.nameValidation,
                    autoValidate: false,
                    onSaved: (e) => completeProfileProvider
                        .completeProfileModel.employerName = e,
                    prefixIcon: null),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width - 30.0) * 0.50,
                      child: AppTextField.screenTextField(
                          maxLength: 2,
                          textInputType: TextInputType.number,
                          hintText: "How long with this employer?",
                          focusNode: howLongNode,
                          validator: TextFieldValidation.numberValidation,
                          autoValidate: false,
                          onSaved: (e) => completeProfileProvider
                              .completeProfileModel.howLongwithEmployer = e,
                          prefixIcon: null),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom:10.0),
                  height: height * 0.07,
                  child: AppButton.loginButton(
                      onTap: () {
                        completeProfileProvider.completeProfileLogic();
                      },
                      title: "Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
