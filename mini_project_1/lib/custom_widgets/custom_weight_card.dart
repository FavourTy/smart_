import 'package:flutter/material.dart';

import '../shared/app_color.dart';
import '../shared/constants.dart';

class CustomWeightCard extends StatelessWidget {
  const CustomWeightCard({
    super.key,
    required this.text,
    required this.onIncrement,
    required this.onDecrement,
    required this.weight,
  });
  final String text;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final double weight;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.0,
      width: 170.0,
      decoration: BoxDecoration(
          color: AppColor.scond,
          borderRadius: BorderRadius.circular(circularRadius)),
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
              "${weight.round()}",
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
