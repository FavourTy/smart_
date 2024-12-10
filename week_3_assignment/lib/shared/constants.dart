import 'package:flutter/material.dart';
import 'package:week_3_assignment/shared/app_colors.dart';

const headingTextStyle = TextStyle(
  fontFamily: "JockeyOne",
  fontSize: 35.0,
  fontWeight: FontWeight.w400,
  color: AppColors.textColor,
);

const normalText = TextStyle(
  color: AppColors.textColor,
  fontFamily: "Inter",
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
);
const buttonText = TextStyle(
  color: AppColors.buttonTextColor,
  fontFamily: "Inter",
  fontSize: 20.0,
  fontWeight: FontWeight.w900,
);
const textFormFieldHeading = TextStyle(
  color: AppColors.textColor,
  fontFamily: "Inter",
  fontSize: 20.0,
  fontWeight: FontWeight.w900,
);
const underlinedText = TextStyle(
  color: AppColors.buttonBgColor,
  fontSize: 12.0,
  fontWeight: FontWeight.w600,
  decoration: TextDecoration.underline,
  decorationColor: AppColors.buttonBgColor,
  decorationThickness: 4,
  // decorationStyle: TextDecorationStyle.dashed
);

final ButtonStyle buttonPri = ElevatedButton.styleFrom(
    minimumSize: Size(410, 62),
    backgroundColor: AppColors.buttonBgColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50))));
