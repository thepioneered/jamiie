import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jamiee_flutter/src/providers/adminPool/createPoolProvider.dart';
import 'package:jamiee_flutter/src/styles/text.dart';
import 'package:jamiee_flutter/src/utils/icons.dart';
import 'package:jamiee_flutter/src/utils/validationRegex.dart';
import 'package:jamiee_flutter/src/widgets/appTextFields/appTextField.dart';
import 'package:jamiee_flutter/src/widgets/button/appButton.dart';
import 'package:provider/provider.dart';
import '../../styles/colors.dart';
import '../../widgets/appBar.dart';
import '../../widgets/pageHeading.dart';

class CreatePoolPage extends StatefulWidget {
  @override
  _CreatePoolPageState createState() => _CreatePoolPageState();
}

class _CreatePoolPageState extends State<CreatePoolPage> {
  FocusNode nodeAmount;
  List<String> _dropdownValues = ["One", "Three", "Four"];
  int index = 0;
  @override
  void initState() {
    nodeAmount = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    CreatePoolProvider().dispose();
    nodeAmount.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var createPoolProvider = Provider.of<CreatePoolProvider>(context);
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
                  title: "Create Pool",
                  subTitle: "Enter details to create your own pool"),
              Form(
                autovalidate: createPoolProvider.onceFormValidated,
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
                        prefixIcon: FontAwesomeIcons.pen),
                    AppTextField.screenTextField(
                        toolbarOptions: ToolbarOptions(paste: false),
                        onEyeClick: Tooltip(
                            padding: EdgeInsets.all(10.0),
                            message:
                                "Data regarding what is amount \nwill be submitted here",
                            child: Icon(Icons.info)),
                        hintText: "Pool Amount",
                        validator: TextFieldValidation.amountValidation,
                        autoValidate: false,
                        onSaved: (e) =>
                            createPoolProvider.createPool.amount = e,
                        focusNode: nodeAmount,
                        textInputType: TextInputType.number,
                        prefixIcon: AppIcons.dollarIcon),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            createPoolProvider.selectDate(context);
                          },
                          child: pageChild(
                              context,
                              Row(
                                children: [
                                  Icon(
                                    Icons.date_range,
                                    color: AppColors.grayInputHeading,
                                  ),
                                  SizedBox(
                                    width: 12.0,
                                  ),
                                  createPoolProvider.onceDatePickerClicked
                                      ? Text(
                                          "${createPoolProvider.selectedDate.toLocal()}"
                                              .split(' ')[0],
                                          style: AppTextStyle.inputText,
                                        )
                                      : Text(
                                          "Deadline",
                                          style: AppTextStyle.hintText,
                                        )
                                ],
                              ),
                              createPoolProvider.dateHasError
                                  ? AppColors.red
                                  : AppColors.grayInputHeading),
                        ),
                        pageChild(
                            context,
                            DropdownButtonHideUnderline(
                              child: DropdownButton(
                                // value: Text('Pool Type'),
                                hint: Text(
                                  'Pool Type',
                                  style: AppTextStyle.hintText,
                                ),
                                onChanged: (e) {
                                  // int _index = _dropdownValues.indexWhere(
                                  //   (note) => note.startsWith(e[0]),
                                  // );
                                  // print(_index);
                                  // setState(() {
                                  //   index = _index;
                                  //   print(_dropdownValues[index]);
                                  // });
                                },
                                items: _dropdownValues
                                    .map((value) => DropdownMenuItem(
                                          child: Text(
                                            value,
                                            style: AppTextStyle.inputText,
                                          ),
                                          value: value,
                                        ))
                                    .toList(),
                              ),
                            ),
                            AppColors.grayInputHeading),
                      ],
                    ),
                    createPoolProvider.dateHasError
                        ? Container(
                            margin: EdgeInsets.only(top: 8.0, left: 15.0),
                            child: Text(
                              "Please Select Date",
                              style: AppTextStyle.errorText,
                            ))
                        : Container(),
                    SizedBox(
                      height: 30.0,
                    ),
                    RangeSlider(
                        divisions: 30,
                        labels: RangeLabels(createPoolProvider.start.toString(),
                            createPoolProvider.end.toString()),
                        values: RangeValues(
                            createPoolProvider.start, createPoolProvider.end),
                        min: 0.0,
                        max: 30.0,
                        onChanged: (values) {
                          createPoolProvider.setRangeSlider(
                              values.start.roundToDouble(),
                              values.end.roundToDouble());
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Min People",
                          style: AppTextStyle.minMaxPeople,
                        ),
                        Text(
                          "Max People",
                          style: AppTextStyle.minMaxPeople,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    createPoolProvider.onceClicked
                        ? AppButton.loginButton(
                            loader: true, onTap: () {}, title: "Create Pool")
                        : AppButton.loginButton(
                            loader: false,
                            onTap: () {
                              // print(Focus.of(context).hasFocus);
                              // if (Focus.of(context).hasFocus)
                              //   Focus.of(context).unfocus();
                              createPoolProvider.createPoolLogic();
                            },
                            title: "Create Pool"),
                  ],
                ),
              )
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
