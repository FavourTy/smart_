import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:floww/features/screens/authentication/sign_up_screen/sign_up_screen.dart';
import 'package:floww/shared/app_assets.dart';
import 'package:floww/shared/custom_widget/app_button.dart';

import 'package:flutter/material.dart';

import '../../shared/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSplashScreen(
              splashTransition: SplashTransition.rotationTransition,
              splash: AppAssets.message,
              nextScreen: SignUpScreen()),
          SizedBox(
            height: 20,
          ),
          Text("Floww"),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
