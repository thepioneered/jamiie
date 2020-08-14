import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/providers/AfterLoginForm/formProvider.dart';
import 'package:jamiee_flutter/src/styles/colors.dart';
import 'package:jamiee_flutter/src/styles/text.dart';
import 'package:jamiee_flutter/src/widgets/button/appButton.dart';
import 'package:provider/provider.dart';


class OurDropdown {
  static Container dropdown({
    @required Function(String) onchanged,
    @required String value,
    @required List items,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1, color: AppColors.primaryColorPurple),
        
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: DropdownButton<String>(
          dropdownColor: AppColors.white,
          hint: Text('Choose option'),
          iconSize: 40,
          //iconEnabledColor: AppColors.primaryBlue,
         style: AppTextStyle.dropDownStyleForm,
          underline: SizedBox(),
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
      ),
    );
  }
}




