import 'package:floww/features/screens/authentication/view_models/authentication_provider.dart';
import 'package:floww/shared/app_colors.dart';
import 'package:floww/shared/custom_widget/app_button.dart';
import 'package:floww/shared/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../shared/constants.dart';
import '../../../../../shared/custom_widget/app_text_input_field.dart';
import '../../../../../shared/navigation/app_route_strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        title: Text(
          "Log in",
          style: headingStyle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                AppRouter.push(AppRouteStrings.signUpScreen);
              },
              child: Text(
                "Sign Up",
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Consumer<AuthenticationProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                    height: 100,
                  ),
                  if (value.loading)
                    Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation(AppColors.primaryColor),
                      ),
                    )
                  else
                    AppButton(
                        text: "Login",
                        onTap: () async {
                          await value.login(
                              email: emailController.text,
                              password: passwordController.text);
                        }),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Forgot your password?",
                    style:
                        labelTextStyle.copyWith(color: AppColors.primaryColor),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
