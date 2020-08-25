import '../../widgets/appTextFields/inputDeoration.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../styles/colors.dart';
import '../../providers/adminPool/createPoolProvider.dart';
import '../../styles/text.dart';
import '../../utils/icons.dart';
import '../../utils/validationRegex.dart';
import '../../widgets/appTextFields/appTextField.dart';
import '../../widgets/button/appButton.dart';
import 'package:provider/provider.dart';
import '../../widgets/appBar.dart';
import '../../widgets/pageHeading.dart';

class CreatePoolPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CreatePoolProvider(),
      child: CreatePoolWidget(),
    );
  }
}

class CreatePoolWidget extends StatefulWidget {
  @override
  _CreatePoolWidgetState createState() => _CreatePoolWidgetState();
}

class _CreatePoolWidgetState extends State<CreatePoolWidget> {
  FocusNode nodeAmount;
  FocusNode memberNode;
  List<String> _dropdownValues = ["Monthly", "Weekly"];

  @override
  void initState() {
    nodeAmount = FocusNode();
    memberNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nodeAmount.dispose();
    memberNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var createPoolProvider = Provider.of<CreatePoolProvider>(context);
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: createPoolProvider.createPoolScaffoldKey,
      appBar: AppBarWidget.getAppBar(context, '', isRegistration: false),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.white,
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          height: MediaQuery.of(context).size.height - 75.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              PageHeading.topHeading(
                  height: height,
                  title: "Create Pool",
                  subTitle: "Enter details to create your own pool"),
              Form(
                autovalidate: createPoolProvider.pageModel.onceFormSubmitted,
                key: createPoolProvider.createPoolFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextField.screenTextField(
                      hintText: "Pool Name",
                      onEdittingComplete: () => nodeAmount.requestFocus(),
                      validator: TextFieldValidation.nameValidation,
                      autoValidate: false,
                      onSaved: (e) =>
                          createPoolProvider.createPool.poolName = e,
                      prefixIcon: FontAwesomeIcons.pen,
                    ),
                    AppTextField.screenTextField(
                      toolbarOptions: ToolbarOptions(paste: false),
                      onEyeClick: Tooltip(
                        padding: EdgeInsets.all(10.0),
                        message:
                            "Data regarding what is amount \nwill be submitted here",
                        child: Icon(
                          Icons.info,
                        ),
                      ),
                      hintText: "Pool Amount",
                      validator: TextFieldValidation.amountValidation,
                      autoValidate: false,
                      onEdittingComplete: () => memberNode.requestFocus(),
                      onSaved: (e) =>
                          createPoolProvider.createPool.amount = int.parse(e),
                      focusNode: nodeAmount,
                      textInputType: TextInputType.number,
                      prefixIcon: AppIcons.dollarIcon,
                    ),
                    AppTextField.screenTextField(
                      hintText: "Pool Members",
                      maxLength: 2,
                      textInputType: TextInputType.number,
                      validator: TextFieldValidation.memberValidation,
                      focusNode: memberNode,
                      autoValidate: false,
                      onSaved: (e) =>
                          createPoolProvider.createPool.poolMember = e,
                      prefixIcon: FontAwesomeIcons.users,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 80.0,
                          width:
                              (MediaQuery.of(context).size.width - 30.0) / 2 -
                                  15.0,
                          child: GestureDetector(
                            onTap: () => createPoolProvider.selectDate(context),
                            child: AbsorbPointer(
                              child: TextFormField(
                                controller: createPoolProvider.date,
                                keyboardType: TextInputType.datetime,
                                validator: (value) {
                                  if (value.isEmpty) return "Select Date!";
                                  return null;
                                },
                                style: AppTextStyle.inputText,
                                onChanged: (value) {
                                  nodeAmount.unfocus();
                                },
                                decoration:
                                    AppInputDecoration.textFieldDecoration(
                                  Icons.date_range,
                                  null,
                                  "Deadline",
                                  EdgeInsets.only(left: 16.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width:
                              (MediaQuery.of(context).size.width - 30.0) / 2 -
                                  15.0,
                          child: DropdownButtonFormField<String>(
                            onSaved: (e) =>
                                createPoolProvider.createPool.poolType = e,
                            decoration: AppInputDecoration.dropdownDecoration(),
                            autovalidate: false,
                            hint: Text(
                              'Pool Type',
                              style: AppTextStyle.hintText,
                            ),
                            validator: (value) => value == null
                                ? 'Please select Pool type'
                                : null,
                            onChanged: (e) {},
                            items: _dropdownValues
                                .map((value) => DropdownMenuItem<String>(
                                      child: Text(
                                        value,
                                        style: AppTextStyle.inputText,
                                      ),
                                      value: value,
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      height: height * 0.07,
                      child: createPoolProvider.pageModel.onceClicked
                          ? AppButton.loginButton(
                              loader: true, onTap: () {}, title: "Create Pool")
                          : AppButton.loginButton(
                              loader: false,
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                createPoolProvider.createPoolLogic();
                              },
                              title: "Create Pool"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget pageChild(BuildContext ctx, Widget child, Color borderColor) {
    return Container(
        height: 49.0,
        padding: EdgeInsets.only(left: 12.0, top: 8.0, bottom: 8.0, right: 8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: borderColor, width: 1.0)),
        width: (MediaQuery.of(context).size.width - 30.0) / 2 - 15.0,
        child: child);
  }
}
