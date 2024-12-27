import 'package:flutter/material.dart';
import 'package:mini_project_1/custom_widgets/custom_button.dart';
import 'package:mini_project_1/custom_widgets/custom_age_card.dart';
import 'package:mini_project_1/custom_widgets/custom_gender_card.dart';
import 'package:mini_project_1/custom_widgets/custom_height_container.dart';
import 'package:mini_project_1/model/calculation_class.dart';
import 'package:mini_project_1/navigation/app_route_strings.dart';
import 'package:mini_project_1/shared/app_color.dart';
import 'package:mini_project_1/shared/constants.dart';

import '../custom_widgets/custom_weight_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BMICalculator calculator = BMICalculator();
  void _calculateandNavigate() {
    setState(() {
      double bmi = calculator.calculateBMI();
      String category = calculator.getBmiCategory();
      String text = calculator.getBc();
      Navigator.pushNamed(context, AppRouteStrings.resultpage,
          arguments: {"bmi": bmi, "catgry": category, "text": text});
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text(
                "BMI Calculator",
                style: headingTextStyle,
              ),
              const SizedBox(
                height: 40,
              ),
              const Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: GenderContainer(icon: Icons.male, text: "Male"),
                  )),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: GenderContainer(
                        icon: Icons.female,
                        text: 'Female',
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Heightcontainer(
                        value: calculator.height,
                        onchanged: (double newvalue) {
                          setState(() {
                            calculator.height = newvalue;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          CustomWeightCard(
                            text: "weight",
                            onIncrement: () {
                              setState(() {
                                calculator.weight++;
                              });
                            },
                            onDecrement: () {
                              setState(() {
                                if (calculator.weight > 0) {
                                  calculator.weight--;
                                }
                              });
                            },
                            weight: calculator.weight,
                          ),
                          const SizedBox(height: 26),
                          CustomCard(
                            text: "Age",
                            onIncrement: () {
                              setState(() {
                                calculator.age++;
                              });
                            },
                            onDecrement: () {
                              setState(() {
                                if (calculator.age > 0) {
                                  calculator.age--;
                                }
                              });
                            },
                            age: calculator.age,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: CustomButton(
                    callBack: () => _calculateandNavigate(), text: "Lets Go"),
              )
            ],
          ),
        ),
      )),
    );
  }
}
