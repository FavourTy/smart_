import 'package:floww/shared/app_colors.dart';
import 'package:floww/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextInputField extends StatelessWidget {
  const AppTextInputField(
      {super.key,
      this.fieldKey,
      this.controller,
      this.text,
      this.inputFormatters,
      this.validator,
      this.suffix,
      this.myFocusNode,
      this.hintText});

  final Key? fieldKey;
  final TextEditingController? controller;
  final String? text;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String?)? validator;
  final String? suffix;
  final FocusNode? myFocusNode;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        key: key,
        controller: controller,
        focusNode: myFocusNode,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
            suffixText: suffix ?? '',
            suffixStyle: labelTextStyle.copyWith(color: AppColors.primaryColor),
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: text,
            labelStyle: labelTextStyle,
            hintText: hintText,
            hintStyle: labelTextStyle,
            border: OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.textFormFieldColor)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.errorColor)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
            focusedErrorBorder: OutlineInputBorder(),
            fillColor: AppColors.textFormFieldfillColor),
      ),
    );
  }
}
