import 'package:flutter/material.dart';
import 'package:week_3_assignment/shared/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.callback, required this.text});
  final VoidCallback callback;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: callback,
        style: buttonPri,
        child: Text(
          text,
          style: buttonText,
        ));
    // return GestureDetector(
    //   onTap: callback,
    //   child: Container(
    //     // height: 200,
    //     padding: const EdgeInsets.symmetric(horizontal: 170.0, vertical: 15.0),
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(30),
    //         color: AppColors.buttonBgColor),
    //     child: Text(
    //       text,
    //       style: buttonText,
    //     ),
    //   ),
    // );
  }
}
