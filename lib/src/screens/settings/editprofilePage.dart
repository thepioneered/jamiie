import 'package:Jamiie/src/providers/settings/editProfileProvidder.dart';
import 'package:flutter/material.dart';
import '../../widgets/appTextFields/appTextField.dart';
import 'package:provider/provider.dart';
import '../../styles/text.dart';
import '../../styles/colors.dart';
import '../../widgets/pageHeading.dart';
import '../../widgets/appBar.dart';

class EditprofilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (_) => EditProfileProvider(),
      child: Consumer<EditProfileProvider>(
          builder: (_, editProfileProvider, child) {
        return Scaffold(
          backgroundColor: AppColors.white,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              editProfileProvider.handleEditButton();
            },
            child: Icon(editProfileProvider.icon),
          ),
          appBar: AppBarWidget.getAppBar(context, "Edit Profile",
              isRegistration: false),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  PageHeading.topHeading(
                    height: height,
                    title: "Edit Details",
                    subTitle: "Edit your details",
                  ),
                  editProfileProvider.editButtonClicked
                      ? Container(
                          child: Column(
                            children: [
                              nonEditableField(
                                  iconData: Icons.account_circle,
                                  title: "Nakul Garg"),
                              nonEditableField(
                                  iconData: Icons.email,
                                  title: "acb@gmail.com"),
                              nonEditableField(
                                  iconData: Icons.account_circle,
                                  title: "Nakul Garg"),
                              nonEditableField(
                                  iconData: Icons.account_circle,
                                  title: "Nakul Garg"),
                            ],
                          ),
                        )
                      : Container(
                          child: Column(
                            children: [
                              AppTextField.screenTextField(
                                hintText: "Nakul",
                                validator: (e) {},
                                autoValidate: false,
                                onSaved: (e) {},
                                prefixIcon: Icons.account_circle,
                              ),
                              AppTextField.screenTextField(
                                hintText: "Nakul",
                                validator: (e) {},
                                autoValidate: false,
                                onSaved: (e) {},
                                prefixIcon: Icons.account_circle,
                              ),
                              AppTextField.screenTextField(
                                hintText: "Nakul",
                                validator: (e) {},
                                autoValidate: false,
                                onSaved: (e) {},
                                prefixIcon: Icons.account_circle,
                              ),
                              AppTextField.screenTextField(
                                hintText: "Nakul",
                                validator: (e) {},
                                autoValidate: false,
                                onSaved: (e) {},
                                prefixIcon: Icons.account_circle,
                              ),
                              AppTextField.screenTextField(
                                hintText: "Nakul",
                                validator: (e) {},
                                autoValidate: false,
                                onSaved: (e) {},
                                prefixIcon: Icons.account_circle,
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget nonEditableField(
      {@required IconData iconData, @required String title}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30.0),
      width: double.infinity,
      height: 49.0,
      padding: EdgeInsets.only(left: 12.0, top: 8.0, bottom: 8.0, right: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(width: 1.0, color: AppColors.grayInputHeading),
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            color: AppColors.grayInputHeading,
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            title,
            style: AppTextStyle.inputText,
          )
        ],
      ),
    );
  }
}
