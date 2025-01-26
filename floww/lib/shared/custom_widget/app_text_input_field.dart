import 'package:floww/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextInputField extends StatelessWidget {
  const AppTextInputField(
      {super.key,
      this.fieldKey,
      this.controller,
      this.text,
      this.inputFormatters,
      this.validator});

  final Key? fieldKey;
  final TextEditingController? controller;
  final String? text;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: controller,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          labelText: text,
          border: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textFormFieldColor)),
          errorBorder: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedErrorBorder: OutlineInputBorder(),
          fillColor: AppColors.textFormFieldfillColor),
    );
  }
}
