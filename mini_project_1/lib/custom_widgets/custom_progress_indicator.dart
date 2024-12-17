// ignore_for_file: prefer_const_declarations, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/app_color.dart';
import 'package:mini_project_1/shared/constants.dart';

class ResultCard extends StatefulWidget {
  const ResultCard({super.key, required this.result, required this.text});
  final double result;
  final String text;

  @override
  State<ResultCard> createState() => _ResultCardState();
}

class _ResultCardState extends State<ResultCard> {
  @override
  Widget build(BuildContext context) {
    final siz = 250.0;
    return TweenAnimationBuilder(
      builder: (context, value, child) {
        return Container(
          height: siz,
          width: siz,
          child: Stack(
            children: [
              ShaderMask(
                  shaderCallback: (rect) {
                    return SweepGradient(
                        colors: const [AppColor.buttonColor, AppColor.scond],
                        endAngle: 3.14 * 2,
                        startAngle: 0.0,
                        stops: [value / 40, value / 40]).createShader(rect);
                  },
                  child: Container(
                    height: siz,
                    width: siz,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColor.scond),
                  )),
              Center(
                  child: Container(
                height: siz - 50,
                width: siz - 50,
                decoration: const BoxDecoration(
                    color: AppColor.backgroundColor, shape: BoxShape.circle),
                child: Center(
                  child: Text(
                    "${widget.text}",
                    style: intTextStyle.copyWith(color: AppColor.buttonColor),
                  ),
                ),
              ))
            ],
          ),
        );
      },
      tween: Tween(begin: 0.0, end: widget.result),
      duration: const Duration(seconds: 1),
    );
  }
}
