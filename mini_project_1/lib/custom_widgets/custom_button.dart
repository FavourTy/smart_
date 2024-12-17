import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/app_color.dart';
import 'package:mini_project_1/shared/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.callBack, required this.text});
  final VoidCallback callBack;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callBack,
      style: buttonStyle,
      child: Text(
        text,
        style: normalTextStyle.copyWith(color: AppColor.scond),
      ),
    );
  }
}
