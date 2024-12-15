import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:week_3_assignment/shared/app_colors.dart';
import 'package:week_3_assignment/widgets/custom_button.dart';
import 'package:week_3_assignment/shared/constants.dart';
import 'package:week_3_assignment/widgets/textformfield.dart';

import '../shared/app_assets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _fullNameEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();
  final _emailEditingController = TextEditingController();
  final _phoneNoEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.bgcolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "CodeChamp.in",
                      style: headingTextStyle,
                    ),
                    Image.asset(
                      AppAssets.menu,
                      height: 30,
                    ),
                    //SvgPicture.asset(AppAssets.hamburgerIcon),
                  ],
                ),
                const SizedBox(
                  height: 70.0,
                ),
                const Text(
                  "Create Account Now!",
                  style: headingTextStyle,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Full Name",
                  style: textFormFieldHeading,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormFieldInput(
                  control: _fullNameEditingController,
                  keyBoardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Email",
                  style: textFormFieldHeading,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormFieldInput(
                  control: _emailEditingController,
                  keyBoardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Password",
                  style: textFormFieldHeading,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormFieldInput(
                  control: _passwordEditingController,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Phone No",
                  style: textFormFieldHeading,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormFieldInput(
                  control: _phoneNoEditingController,
                  keyBoardType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 60.0,
                ),
                Center(child: CustomButton(callback: () {}, text: "Sign Up"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
