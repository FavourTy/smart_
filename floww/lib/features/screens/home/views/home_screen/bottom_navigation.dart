import 'package:floww/features/screens/home/views/home_screen/customer_screen.dart';
import 'package:floww/features/screens/home/views/home_screen/home_screen.dart';
import 'package:floww/features/screens/home/views/home_screen/settings_screen.dart';
import 'package:floww/shared/app_assets.dart';
import 'package:floww/shared/app_colors.dart';
import 'package:floww/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButtomNavigationBar extends StatefulWidget {
  const CustomButtomNavigationBar({super.key});

  @override
  State<CustomButtomNavigationBar> createState() =>
      _CustomButtomNavigationBarState();
}

class _CustomButtomNavigationBarState extends State<CustomButtomNavigationBar> {
  int _selectedIndex = 0;
  void onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = [
    HomeScreen(),
    CustomerScreen(),
    SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.backgroundColor,
          currentIndex: _selectedIndex,
          onTap: onTapItem,
          unselectedItemColor: AppColors.previewTextColor,
          selectedLabelStyle: homeTextStyle.copyWith(fontSize: 16),
          unselectedLabelStyle: tabBarTextStyle,
          selectedItemColor: AppColors.primaryColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.msgSvg),
              label: "Message",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.customerSvg),
              label: "Customers",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.settingsSvg),
              label: "Settings",
            )
          ]),
    );
  }
}
