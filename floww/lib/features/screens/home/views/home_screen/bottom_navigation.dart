import 'package:floww/features/screens/home_screen/customer_screen.dart';
import 'package:floww/features/screens/home_screen/home_screen.dart';
import 'package:floww/features/screens/home_screen/settings_screen.dart';
import 'package:floww/shared/app_colors.dart';
import 'package:floww/shared/constants.dart';
import 'package:flutter/material.dart';

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
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.textsms),
              label: "Message",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: "Customers",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            )
          ]),
    );
  }
}
