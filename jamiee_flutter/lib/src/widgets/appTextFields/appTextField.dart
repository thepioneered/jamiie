import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/styles/text.dart';
import 'package:jamiee_flutter/src/widgets/appTextFields/inputDeoration.dart';


class AppTextField {
 static SizedBox screenTextField(
      {@required String hintText,
      @required Function(String) validator,
      @required bool autoValidate,
      @required Function(String) onSaved,
      bool autofocus,
      bool showPassword,
      GestureDetector onEyeClick,
      int maxLength,
      @required IconData prefixIcon,
      TextEditingController controller,
      TextInputType textInputType}) {
    return SizedBox(
      height: 80,
      child: TextFormField(
        style: AppTextStyle.inputText,
      
        
        controller: controller,
        keyboardType: textInputType,
        obscureText: showPassword == null ? false : !showPassword,
        validator: validator,
        
        maxLength: maxLength,
        autovalidate: autoValidate,
        decoration: AppInputDecoration.textFieldDecoration(
            prefixIcon, onEyeClick, hintText),
        
        onSaved: onSaved,
        autofocus: autofocus == null ? false : autofocus,
        maxLines: 1,
      ),
    );
  }
}
