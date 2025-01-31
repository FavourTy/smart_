// ignore_for_file: use_build_context_synchronously

import 'package:floww/features/screens/authentication/view_models/authentication_provider.dart';
import 'package:floww/shared/app_colors.dart';
import 'package:floww/shared/constants.dart';
import 'package:floww/shared/custom_widget/app_button.dart';
import 'package:floww/shared/custom_widget/app_text_input_field.dart';
import 'package:floww/shared/navigation/app_route_strings.dart';
import 'package:floww/shared/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
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
        leading:
            IconButton(onPressed: () {}, icon: Icon(Icons.cancel_outlined)),
        // leading:
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                AppRouter.push(AppRouteStrings.loginScreen);
              },
              child: Text(
                "Login",
                style: labelTextStyle.copyWith(
                  color: AppColors.primaryColor,
                ),
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
          child: Consumer<AuthenticationProvider>(
            builder: (BuildContext context, AuthenticationProvider authProvider,
                Widget? child) {
              return Form(
                key: _formKey,
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
                            validator: (a) =>
                                (a ?? " ").length > 3 ? null : "Invalid Name",
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: AppTextInputField(
                            controller: lastNameController,
                            text: "Last Name",
                            validator: (a) =>
                                (a ?? " ").length > 3 ? null : "Invalid Name",
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
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z@._-]'))
                      ],
                      validator: (a) {
                        if (!emailRegex.hasMatch(a ?? "")) {
                          return "Invalid Email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppTextInputField(
                      controller: passwordController,
                      text: "Password",
                      suffix: "Show",
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r' '))
                      ],
                      validator: (a) =>
                          (a ?? ' ').isNotEmpty ? null : "Invalid password",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Checkbox(
                            fillColor: WidgetStatePropertyAll(
                                AppColors.labelTextColor),
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
                    if (authProvider.loading)
                      Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation(AppColors.primaryColor),
                        ),
                      )
                    else
                      AppButton(
                          text: "Sign Up",
                          onTap: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              final a = await authProvider.register(
                                  email: emailController.text,
                                  password: passwordController.text);
                              if (a.error != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(a.error ?? " ")));
                              } else {
                                AppRouter.pushAndClear(
                                    AppRouteStrings.bottomNav);
                              }
                            }
                          }),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
