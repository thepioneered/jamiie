import 'package:flutter/material.dart';
import '../../styles/text.dart';
import '../../widgets/appTextFields/inputDeoration.dart';

class AppTextField {
  static Widget screenTextField(
      {@required String hintText,
      @required Function(String) validator,
      @required bool autoValidate,
      @required Function(String) onSaved,
      int maxLines,
      double height,
      ToolbarOptions toolbarOptions,
      Function onEdittingComplete,
      bool autofocus,
      bool showPassword,
      Widget onEyeClick,
      int maxLength,
      FocusNode focusNode,
      @required IconData prefixIcon,
      TextEditingController controller,
      EdgeInsetsGeometry edge,
      TextInputType textInputType}) {
    return Container(
      height: height != null?height:75.0,
      child: TextFormField(
        toolbarOptions: toolbarOptions,
        focusNode: focusNode,
        style: AppTextStyle.inputText,
        onEditingComplete: onEdittingComplete,
        controller: controller,
        keyboardType: textInputType,
        obscureText: showPassword == null ? false : !showPassword,
        validator: validator,
        maxLength: maxLength,
        autovalidate: autoValidate,
        decoration: AppInputDecoration.textFieldDecoration(
            prefixIcon, onEyeClick, hintText, edge),
        onSaved: onSaved,
        autofocus: autofocus == null ? false : autofocus,
        
        maxLines: maxLines == null ? 1 : maxLines,
      ),
    );
  }
}
