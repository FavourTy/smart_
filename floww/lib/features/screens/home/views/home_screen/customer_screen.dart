import 'package:flutter/material.dart';

import '../../../../../shared/app_colors.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Icon(
          Icons.person_2_outlined,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
