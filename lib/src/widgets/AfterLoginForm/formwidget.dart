import '../../widgets/appTextFields/inputDeoration.dart';
import 'package:flutter/material.dart';
import '../../styles/text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OurDropdown {
  static Widget dropdown({
    @required Function(String) onchanged,
    @required String value,
    @required List items,
    @required Function(String) validator,
    @required bool autoValidate,
  }) {
    return SizedBox(
      height: 75.h,
      child: DropdownButtonFormField<String>(
        decoration: AppInputDecoration.dropdownDecoration(),
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
