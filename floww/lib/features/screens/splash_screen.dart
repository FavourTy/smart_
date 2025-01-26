import 'package:floww/shared/app_assets.dart';
import 'package:floww/shared/custom_widget/app_button.dart';
import 'package:floww/shared/navigation/app_route_strings.dart';
import 'package:flutter/material.dart';

import '../../shared/app_colors.dart';
import '../../shared/navigation/app_router.dart';

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
          Icon(
            Icons.mail,
            color: AppColors.backgroundColor,
          ),
          // Image.asset(AppAssets.message),
          SizedBox(
            height: 20,
          ),
          Text("Text Message"),
          SizedBox(
            height: 20,
          ),
          AppButton(text: "Next")
        ],
      ),
    );
  }
}
