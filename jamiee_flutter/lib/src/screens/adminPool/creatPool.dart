import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/providers/adminPool/createPoolProvider.dart';
import 'package:jamiee_flutter/src/utils/validationRegex.dart';
import 'package:jamiee_flutter/src/widgets/appTextFields/appTextField.dart';
import 'package:provider/provider.dart';
import '../../styles/colors.dart';
import '../../widgets/appBar.dart';
import '../../widgets/pageHeading.dart';

import 'package:webview_flutter/webview_flutter.dart';

class CreatePoolPage extends StatelessWidget {
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
                key: createPoolProvider.createPoolFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextField.screenTextField(
                        hintText: "Pool Name",
                        validator: TextFieldValidation.nameValidation,
                        autoValidate: false,
                        onSaved: (e) => e,
                        prefixIcon: Icons.ac_unit),
                    AppTextField.screenTextField(
                        hintText: "Pool Name",
                        validator: TextFieldValidation.nameValidation,
                        autoValidate: false,
                        onSaved: (e) => e,
                        prefixIcon: Icons.ac_unit),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [counter(context), counter(context)],
                    ),
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
                    FlatButton(
                      child: Text("Select Time"),
                      onPressed: () {
                        showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget counter(BuildContext ctx) {
    return Container(
      height: 50.0,
      color: AppColors.primaryBlue,
      width: (MediaQuery.of(ctx).size.width - 30.0) / 2 - 30.0,
      child: SizedBox(
          height: 50.0,
          child: Row(
            children: [
              Expanded(child: Center(child: Text("C"))),
              Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: SizedBox(child: Icon(Icons.add)),
                  ),
                  InkWell(
                    onTap: () {},
                    child: SizedBox(child: Icon(Icons.add)),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
