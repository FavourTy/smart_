import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../constants.dart';

class CustomHomeWidget extends StatelessWidget {
  const CustomHomeWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
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
