import 'package:floww/shared/app_colors.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Icon(
          Icons.settings,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
