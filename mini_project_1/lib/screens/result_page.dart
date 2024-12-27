import 'package:flutter/material.dart';
import 'package:mini_project_1/custom_widgets/custom_result_card.dart';
import 'package:mini_project_1/custom_widgets/custom_progress_indicator.dart';
import 'package:mini_project_1/shared/app_color.dart';
import 'package:mini_project_1/shared/constants.dart';

class Resultpage extends StatefulWidget {
  const Resultpage({
    super.key,
    required this.bmi,
    required this.catgry,
    required this.text,
  });
  final double bmi;
  final String catgry;
  final String text;
  @override
  State<Resultpage> createState() => _ResultpageState();
}

class _ResultpageState extends State<Resultpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Back',
                  style: normalTextStyle.copyWith(color: AppColor.textColor),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Your BMI is ',
                style: headingTextStyle.copyWith(color: AppColor.buttonColor),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                  child: ResultCard(
                result: double.parse(widget.bmi.toStringAsFixed(1)),
                text: widget.bmi.toStringAsFixed(1),
              )),
              const SizedBox(
                height: 25,
              ),
              Center(
                  child: Text(
                widget.text,
                style: normalTextStyle.copyWith(
                    color: AppColor.buttonColor, fontSize: 30),
              )),
              const SizedBox(
                height: 30,
              ),
              Center(child: CustomR(text: widget.catgry))
            ],
          ),
        ),
      ),
    );
  }
}
