import 'package:flutter/material.dart';
import 'package:week_3_assignment/shared/app_colors.dart';
import 'package:week_3_assignment/shared/constants.dart';

class TextFormFieldInput extends StatelessWidget {
  const TextFormFieldInput(
      {super.key, this.control, this.validate, this.keyBoardType});
  final TextEditingController? control;
  final String? Function(String?)? validate;
  final TextInputType? keyBoardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: control,
      validator: validate,
      cursorColor: AppColors.bgcolor,
      style: normalText.copyWith(
          fontWeight: FontWeight.w400,
          color: AppColors.buttonTextColor,
          fontSize: 19),
      keyboardType: keyBoardType,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          filled: true,
          fillColor: AppColors.textFormFieldFillColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: AppColors.bgcolor,
              ))),
    );
  }
}
