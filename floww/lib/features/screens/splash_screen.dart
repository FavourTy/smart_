import 'package:floww/shared/app_assets.dart';
import 'package:floww/shared/constants.dart';
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
          Center(
            child: Image.asset(
              AppAssets.message,
              height: 100,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Floww",
              style: splashStyle,
            ),
          ),
        ],
      ),
    );
  }
}
