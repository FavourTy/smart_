import 'package:flutter/material.dart';
import 'package:week_3_assignment/shared/app_colors.dart';
import 'package:week_3_assignment/shared/constants.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:week_3_assignment/shared/app_assets.dart';
import 'package:week_3_assignment/navigation/widgets/custom_button.dart';
import 'package:week_3_assignment/navigation/app_route_strings.dart';


import '../shared/social_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgcolor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "CodeChamp.in",
                  style: headingTextStyle.copyWith(),
                ),
                Image.asset(
                  AppAssets.menu,
                  height: 33,
                ),
                // SvgPicture.asset(
                //   AppAssets.hamburgerIcon,
                // )
              ],
            ),
            const SizedBox(
              height: 65.0,
            ),
            Image.asset(
              AppAssets.welcome,
              //height: 100,
            ),
            //SvgPicture.asset(AppAssets.welcomeScreenImage),
            const SizedBox(
              height: 50.0,
            ),
            Text(
              "Hello , Welcome !",
              style: headingTextStyle.copyWith(),
            ),
            const SizedBox(height: 30),
            Text(
              "Welcome to codeChamp.in Top platform \nto coders",
              textAlign: TextAlign.center,
              style: normalText.copyWith(),
            ),
            const SizedBox(
              height: 35,
            ),
            CustomButton(
              callback: () {
                Navigator.pushNamed(context, AppRouteString.login_screen);
              },
              text: "Login",
            ),
            const SizedBox(
              height: 25,
            ),
            CustomButton(
              callback: () {
                Navigator.pushNamed(context, AppRouteString.signup_screen);
              },
              text: "Signup",
            ),

            SizedBox(
              height: 35.0,
            ),
            Text(
              "Or  via social media",
              style: normalText.copyWith(
                  fontWeight: FontWeight.w500, fontSize: 14.0),
            ),
            SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 140),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocialButton(
                    backgroundImage: AssetImage(AppAssets.fbk),
                  ),
                  SocialButton(
                    backgroundImage: AssetImage(AppAssets.goog),
                  ),
                  SocialButton(
                    backgroundImage: AssetImage(AppAssets.ln),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
