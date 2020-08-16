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
      padding: EdgeInsets.symmetric(vertical: 20),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryBlue,
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