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
    @required String hint,
    @required TextStyle dropdownTextStyle,
    @required double iconSize,
  }) {
    return SizedBox(
      height: 75.h,
      child: DropdownButtonFormField<String>(
        decoration: AppInputDecoration.dropdownDecoration(),
        hint: Text(
          hint,
          style: AppTextStyle.hintText,
        ),
        iconSize: iconSize,
        style: dropdownTextStyle,
        autovalidate: autoValidate,
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
