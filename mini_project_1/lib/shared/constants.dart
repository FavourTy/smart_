import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/app_color.dart';

const headingTextStyle = TextStyle(
    fontFamily: "Poppins",
    fontSize: 24.0,
    color: AppColor.textColor,
    fontWeight: FontWeight.w600);
const intTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 62.0,
    fontWeight: FontWeight.w600,
    color: AppColor.textColor);
const normalTextStyle = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 15.0,
  fontWeight: FontWeight.w500,
  color: AppColor.otherTextColor,
);

final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColor.buttonColor,
    minimumSize: const Size(379, 50),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(circularRadius))));

const double circularRadius = 10;
