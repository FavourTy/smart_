import 'package:flutter/material.dart';

import '../shared/app_color.dart';
import '../shared/constants.dart';

class CustomR extends StatelessWidget {
  final String text;
  const CustomR({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 151,
      width: 357,
      decoration: BoxDecoration(
          color: AppColor.scond,
          borderRadius: BorderRadius.circular(circularRadius)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          text,
          style: normalTextStyle.copyWith(
              color: AppColor.textColor, fontSize: 12.0),
        ),
      ),
    );
  }
}
