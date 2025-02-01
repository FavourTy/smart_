import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../constants.dart';

class CustomHomeWidget extends StatelessWidget {
  const CustomHomeWidget({
    super.key,
    required this.text,
  });
  final String text;
  final bool isFirst = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: isFirst ? 16 : 0),
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
