import 'package:floww/shared/app_assets.dart';
import 'package:floww/shared/app_colors.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        title: Text("SignUp"),
        leading: Icon(Icons.cancel),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text("Login"),
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
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              AppButton(text: "Login")
            ],
          ),
        ),
      ),
    );
  }
}
