import 'package:floww/shared/app_colors.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class UserColumn extends StatelessWidget {
  const UserColumn({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(children: [
        CircleAvatar(
          radius: 27,
          backgroundColor: AppColors.backgroundColor,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: userDisplayTextStyle,
        )
      ]),
    );
  }
}
