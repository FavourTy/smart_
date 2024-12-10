import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:week_3_assignment/navigation/app_route_strings.dart';
import 'package:week_3_assignment/shared/app_assets.dart';
import 'package:week_3_assignment/shared/app_colors.dart';
import 'package:week_3_assignment/navigation/widgets/custom_button.dart';
import 'package:week_3_assignment/shared/constants.dart';
import 'package:week_3_assignment/shared/textformfield.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _userNameEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgcolor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
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
              "Welcome Back!",
              style: headingTextStyle,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "Login to continue",
              style: normalText.copyWith(),
            ),
            const SizedBox(
              height: 60.0,
            ),
            const Text(
              "Username",
              style: textFormFieldHeading,
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormFieldInput(
              control: _userNameEditingController,
              keyBoardType: TextInputType.name,
            ),
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              "Password",
              style: textFormFieldHeading,
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormFieldInput(
              control: _passwordEditingController,
            ),
            const SizedBox(
              height: 25.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = !_isChecked;
                        });
                      },
                      fillColor: MaterialStateProperty.all(
                          AppColors.textFormFieldFillColor),
                      checkColor: AppColors.buttonTextColor,
                      focusColor: AppColors.textFormFieldFillColor,
                      hoverColor: AppColors.textFormFieldFillColor,
                      activeColor: AppColors.textFormFieldFillColor,
                      overlayColor: MaterialStatePropertyAll(
                          AppColors.textFormFieldFillColor),
                    ),
                    Text(
                      'Remember me',
                      style: normalText.copyWith(
                          fontSize: 12.0, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Text(
                  'Forget password?',
                  style: normalText.copyWith(
                      fontSize: 12.0, fontWeight: FontWeight.w600),
                )
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Center(
              child: CustomButton(
                callback: () {},
                text: 'Login',
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Center(
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Don’t have an account?",
                        style: normalText.copyWith(
                            fontSize: 12.0, fontWeight: FontWeight.w600)),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(
                                context, AppRouteString.signup_screen);
                          },
                        text: "SignUp",
                        style: underlinedText),
                  ])),
            )
          ],
        ),
      )),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordEditingController;
    _userNameEditingController;
  }
}
