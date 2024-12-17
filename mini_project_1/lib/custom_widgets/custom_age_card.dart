import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/app_color.dart';
import 'package:mini_project_1/shared/constants.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.text,
      required this.onIncrement,
      required this.onDecrement,
      required this.age});
  final String text;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final int age;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.scond,
          borderRadius: BorderRadius.circular(circularRadius)),
      height: 220.0,
      width: 170.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: normalTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "$age",
              style: intTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onDecrement,
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: AppColor.buttonColor,
                      borderRadius: BorderRadius.circular(circularRadius),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.remove,
                        color: AppColor.scond,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onIncrement,
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: AppColor.buttonColor,
                      borderRadius: BorderRadius.circular(circularRadius),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        color: AppColor.scond,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
