import 'package:floww/features/screens/authentication/views/login_screen/login_screen.dart';
import 'package:floww/features/screens/authentication/views/sign_up_screen/sign_up_screen.dart';
import 'package:floww/features/screens/home/views/home_screen/bottom_navigation.dart';
import 'package:floww/features/screens/home/views/home_screen/home_screen.dart';
import 'package:floww/features/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';

import 'app_route_strings.dart';

class AppRouter {
  static final navKey = GlobalKey<NavigatorState>();

  static Route appRouter(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteStrings.base:
        return CupertinoPageRoute(builder: (_) => const SplashScreen());
      case AppRouteStrings.loginScreen:
        return CupertinoPageRoute(builder: (_) => const LoginScreen());
      case AppRouteStrings.signUpScreen:
        return CupertinoPageRoute(builder: (_) => const SignUpScreen());
      case AppRouteStrings.homeScreen:
        return CupertinoPageRoute(builder: (_) => const HomeScreen());
      case AppRouteStrings.bottomNav:
        return CupertinoPageRoute(
            builder: (_) => const CustomButtomNavigationBar());
      // case AppRouteStrings.chatPage:
      //   return CupertinoPageRoute(builder: (_) => const ChatPage(receiverFullName: userData[''],

      //   )
      // );
      default:
        return CupertinoPageRoute(builder: (_) => const SizedBox());
    }
  }

  static void push(String name, {Object? arg}) {
    navKey.currentState?.pushNamed(name, arguments: arg);
  }

  static void pushReplace(String name, {Object? arg}) {
    navKey.currentState?.pushReplacementNamed(name, arguments: arg);
  }

  static void pop(String name, {Object? arg}) {
    navKey.currentState?.pop(arg);
  }

  static void pushAndClear(String name, {Object? arg}) {
    navKey.currentState?.pushNamedAndRemoveUntil(name, (_) => false);
  }
}
