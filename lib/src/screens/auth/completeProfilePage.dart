import 'package:Jamiie/src/providers/auth/completeProfileProvider.dart';
import 'package:Jamiie/src/styles/base.dart';
import 'package:Jamiie/src/styles/colors.dart';
import 'package:Jamiie/src/utils/validationRegex.dart';
import 'package:Jamiie/src/widgets/appBar.dart';
import 'package:Jamiie/src/widgets/appTextFields/appTextField.dart';
import 'package:Jamiie/src/widgets/button/appButton.dart';
import 'package:Jamiie/src/widgets/pageHeading.dart';
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
    double height = MediaQuery.of(context).size.height - 75.0;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget.getAppBar(context, '', isRegistration: false),
      body: SingleChildScrollView(
        child: Container(
          // height: height,
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
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
                          ? InkWell(
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
                                    image: FileImage(imageProviderSignup.image),
                                    fit: BoxFit.fill),
                              ),
                            ),
                    );
                  },
                ),
              ),
              Form(
                key: completeProfileProvider.completeProfileFormKey,
                autovalidate:
                    completeProfileProvider.pageModel.onceFormSubmitted,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width - 50.0) / 2,
                          child: AppTextField.screenTextField(
                              hintText: "Street",
                              validator: null,
                              onEdittingComplete: () =>
                                  stateNode.requestFocus(),
                              autoValidate: false,
                              onSaved: null,
                              prefixIcon: null),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width - 50.0) / 2,
                          child: AppTextField.screenTextField(
                              hintText: "State",
                              focusNode: stateNode,
                              onEdittingComplete: () => cityNode.requestFocus(),
                              validator: null,
                              autoValidate: false,
                              onSaved: null,
                              prefixIcon: null),
                        ),
                      ],
                    ),
                  ],
                ),
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
                        validator: null,
                        autoValidate: false,
                        onSaved: null,
                        prefixIcon: null),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width - 50.0) / 2,
                    child: AppTextField.screenTextField(
                        hintText: "Zipcode",
                        focusNode: zipcodeNode,
                        onEdittingComplete: () => addressNode.requestFocus(),
                        validator: null,
                        autoValidate: false,
                        onSaved: null,
                        prefixIcon: null),
                  ),
                ],
              ),
              AppTextField.screenTextField(
                  hintText: "How long at this address?",
                  focusNode: addressNode,
                  validator: (e) {},
                  autoValidate: false,
                  onSaved: (e) {},
                  prefixIcon: null),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width - 50.0) / 2,
                    child: GestureDetector(
                      onTap: () {},
                      child: AbsorbPointer(
                        child: AppTextField.screenTextField(
                            hintText: "DOB",
                            validator: null,
                            onEdittingComplete: () => ssnNode.requestFocus(),
                            autoValidate: false,
                            onSaved: null,
                            prefixIcon: null),
                      ),
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width - 50.0) / 2,
                    child: AppTextField.screenTextField(
                      hintText: "Last 4 digit of SSN",
                      focusNode: ssnNode,
                      onEdittingComplete: () => employerNode.requestFocus(),
                      validator: null,
                      autoValidate: false,
                      onSaved: null,
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
                  validator: (e) {},
                  autoValidate: false,
                  onSaved: (e) {},
                  prefixIcon: null),
              AppTextField.screenTextField(
                toolbarOptions: ToolbarOptions(
                    copy: false, paste: false, cut: false, selectAll: false),
                prefixIcon: null,
                textInputType: TextInputType.number,
                // maxLength: 4,
                onSaved: (String e) {},
                hintText: "How long with this employer?",
                focusNode: howLongNode,
                autoValidate: false,
                autofocus: false,
                validator: TextFieldValidation.socialNumber,
              ),
              Container(
                height: height * 0.07,
                child: AppButton.loginButton(
                    loader: false, onTap: () {}, title: "Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
