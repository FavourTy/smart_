import 'package:floww/features/screens/authentication/view_models/authentication_provider.dart';
import 'package:floww/shared/app_colors.dart';
import 'package:floww/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../shared/navigation/app_route_strings.dart';
import '../../../../../shared/navigation/app_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          "Settings",
          style: homeTextStyle.copyWith(color: AppColors.headingStyleColor),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Consumer<AuthenticationProvider>(builder: (BuildContext context,
          AuthenticationProvider authProvider, Widget? child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Log out",
                    style: homeTextStyle.copyWith(
                        color: AppColors.headingStyleColor),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  IconButton(
                      onPressed: () {
                        authProvider.logout().then((_) =>
                            AppRouter.pushAndClear(
                                AppRouteStrings.loginScreen));
                      },
                      icon: Icon(
                        Icons.exit_to_app,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
            Center(
              child: Icon(
                Icons.settings,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        );
      }),
    );
  }
}
