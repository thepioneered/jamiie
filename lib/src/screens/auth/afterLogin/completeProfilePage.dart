import 'package:Jamiie/src/providers/auth/completeProfileProvider.dart';
import 'package:Jamiie/src/styles/colors.dart';
import 'package:Jamiie/src/styles/text.dart';
import 'package:Jamiie/src/utils/validationRegex.dart';
import 'package:Jamiie/src/widgets/AfterLoginForm/formwidget.dart';
import 'package:Jamiie/src/widgets/appTextFields/appTextField.dart';
import 'package:Jamiie/src/widgets/button/appButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../repositry/states.dart';

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
    ScreenUtil.init(context, width: 411, height: 683, allowFontScaling: false);
    var completeProfileProvider = Provider.of<CompleteProfileProvider>(context);
    return WillPopScope(
        onWillPop: () => completeProfileProvider.handleLogout(),
        child: Scaffold(
            key: completeProfileProvider.completeProfileScaffoldKey,
            backgroundColor: AppColors.white,
            body: SingleChildScrollView(
              child: Container(
                height: 1.hp,
                alignment: Alignment.center,
                padding:
                    EdgeInsets.only(left: 15.0.w, right: 15.0.w, top: 35.0.h),
                child: Form(
                  key: completeProfileProvider.completeProfileFormKey,
                  // ignore: deprecated_member_use
                  autovalidate:
                      completeProfileProvider.pageModel.onceFormSubmitted,
                  child: Column(
                    children: [
                      ChangeNotifierProvider(
                        create: (context) => ImageProviderCompleteProfile(),
                        child: Consumer<ImageProviderCompleteProfile>(
                          builder: (_, imageProviderSignup, child) {
                            return Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(bottom: 30.0.h),
                              height: 130.0.h,
                              width:
                                  (MediaQuery.of(context).size.width - 30.0) /
                                      2,
                              child: imageProviderSignup.image == null
                                  ? GestureDetector(
                                      onTap: imageProviderSignup.getImage,
                                      child: Container(
                                        alignment: Alignment.center,
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
                                            image: FileImage(
                                                imageProviderSignup.image),
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
                                width: 0.45.wp,
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
                                width: 0.45.wp,
                                child: OurDropdown.dropdown(
                                  hint: 'State',
                                  iconSize: 30,
                                  dropdownTextStyle:
                                      AppTextStyle.dropDownStyleStates,
                                  items: StatesRepo.states,
                                  onchanged: (e) {
                                    completeProfileProvider
                                        .completeProfileModel.state = e;
                                    completeProfileProvider.callListners();
                                  },
                                  value: completeProfileProvider
                                      .completeProfileModel.state,
                                  validator: completeProfileProvider.validator,
                                  autoValidate: false,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 0.45.wp,
                            child: AppTextField.screenTextField(
                                hintText: "City",
                                focusNode: cityNode,
                                onEdittingComplete: () =>
                                    zipcodeNode.requestFocus(),
                                validator: (e) =>
                                    TextFieldValidation.stateCityValidation(
                                        e, "City"),
                                autoValidate: false,
                                onSaved: (e) => completeProfileProvider
                                    .completeProfileModel.city = e,
                                prefixIcon: null),
                          ),
                          Container(
                            width: 0.45.wp,
                            child: AppTextField.screenTextField(
                                hintText: "Zipcode",
                                maxLength: 5,
                                focusNode: zipcodeNode,
                                onEdittingComplete: () =>
                                    addressNode.requestFocus(),
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
                            width: 0.7.wp,
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
                                height: 40.h,
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
                            width: 0.45.wp,
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
                                    onEdittingComplete: () =>
                                        ssnNode.requestFocus(),
                                    autoValidate: false,
                                    onSaved: (value) => completeProfileProvider
                                        .completeProfileModel.date = value,
                                    prefixIcon: null),
                              ),
                            ),
                          ),
                          Container(
                            width: 0.45.wp,
                            child: AppTextField.screenTextField(
                              hintText: "Last 4 digit of SSN",
                              maxLength: 4,
                              focusNode: ssnNode,
                              textInputType: TextInputType.number,
                              onEdittingComplete: () =>
                                  employerNode.requestFocus(),
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
                          validator:
                              TextFieldValidation.completeProfileNameValidation,
                          autoValidate: false,
                          onSaved: (e) => completeProfileProvider
                              .completeProfileModel.employerName = e,
                          prefixIcon: null),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 0.7.wp,
                            child: AppTextField.screenTextField(
                                maxLength: 2,
                                textInputType: TextInputType.number,
                                hintText: "How long with this employer?",
                                focusNode: howLongNode,
                                validator: TextFieldValidation.numberValidation,
                                autoValidate: false,
                                onSaved: (e) => completeProfileProvider
                                    .completeProfileModel
                                    .howLongwithEmployer = e,
                                prefixIcon: null),
                          ),
                          Expanded(
                            child: Container(
                                height: 40.h,
                                alignment: Alignment.center,
                                child: Text(
                                  "Months",
                                  style: AppTextStyle.hintText,
                                )),
                          ),
                        ],
                      ),
                      Container(
                        height: 0.07.hp,
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
            )));
  }
}
