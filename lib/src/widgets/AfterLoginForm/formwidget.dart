import 'package:flutter/material.dart';
import '../../styles/colors.dart';
import '../../styles/text.dart';

class OurDropdown {
  static Widget dropdown({
    @required Function(String) onchanged,
    @required String value,
    @required List items,
    @required Function(String) validator,
    @required bool autoValidate,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          errorStyle: AppTextStyle.errorText,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grayInputHeading),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColorPurple),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColorPurple,
              width: 1,
            ),
          ),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        hint: Text('Choose option'),
        iconSize: 40,
        style: AppTextStyle.dropDownStyleForm,
        autovalidate: autoValidate,
        validator: validator,
        isExpanded: true,
        items: items.map((e) {
          return DropdownMenuItem<String>(
            value: e,
            child: Text(e),
          );
        }).toList(),
        onChanged: onchanged,
        value: value,
      ),
    );
  }
}
