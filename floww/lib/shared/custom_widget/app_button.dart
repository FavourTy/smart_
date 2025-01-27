import 'package:floww/shared/app_colors.dart';
import 'package:floww/shared/constants.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, this.onTap, required this.text});
  final VoidCallback? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: buttonTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
