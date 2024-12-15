import 'package:flutter/material.dart';
import 'package:mini_project_1/custom_widgets/custom_card.dart';
import 'package:mini_project_1/custom_widgets/gender_container.dart';
import 'package:mini_project_1/shared/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCard(text: "weight"),
            SizedBox(
              height: 30,
            ),
            CustomCard(text: "Age"),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GenderContainer(icon: Icons.male, text: "Male"),
                GenderContainer(
                  icon: Icons.female,
                  text: 'Female',
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
