import 'package:floww/shared/app_assets.dart';
import 'package:floww/shared/app_colors.dart';
import 'package:floww/shared/constants.dart';
import 'package:floww/shared/custom_widget/app_button.dart';
import 'package:floww/shared/custom_widget/app_text_input_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        title: Text(
          "Sign Up",
          style: headingStyle,
        ),
        leading: Container(
          height: 2,
          width: 2,
          child: Image.asset(AppAssets.cancel, fit: BoxFit.contain),
        ),
        // leading:
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "Login",
              style: labelTextStyle.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: AppTextInputField(
                      controller: firstNameController,
                      text: "First Name",
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: AppTextInputField(
                      controller: lastNameController,
                      text: "Last Name",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              AppTextInputField(
                controller: emailController,
                text: "Email",
              ),
              SizedBox(
                height: 20,
              ),
              AppTextInputField(
                controller: passwordController,
                text: "Password",
                suffix: "Show",
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Checkbox(
                      fillColor:
                          WidgetStatePropertyAll(AppColors.labelTextColor),
                      checkColor: AppColors.primaryColor,
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = !_isChecked;
                        });
                      }),
                  Expanded(
                    child: Text(
                      "I would like to receive your newsletter and other promotional information.",
                      style: newLetterTextStyle,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              AppButton(
                text: "Sign Up",
              )
            ],
          ),
        ),
      ),
    );
  }
}
