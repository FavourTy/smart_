import 'package:floww/features/screens/authentication/login_screen/login_screen.dart';
import 'package:floww/features/screens/authentication/sign_up_screen/sign_up_screen.dart';
import 'package:floww/features/screens/chat_screen/chat_screen.dart';
import 'package:floww/features/screens/home_screen/bottom_navigation.dart';
import 'package:floww/features/screens/home_screen/home_screen.dart';
import 'package:floww/features/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';

import 'app_route_strings.dart';

class AppRouter {
  static final navKey = GlobalKey<NavigatorState>();

  static Route appRouter(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteStrings.base:
        return CupertinoPageRoute(builder: (_) => const SplashScreen());
      case AppRouteStrings.chatScreen:
        return CupertinoPageRoute(builder: (_) => const ChatScreen());
      case AppRouteStrings.loginScreen:
        return CupertinoPageRoute(builder: (_) => const LoginScreen());
      case AppRouteStrings.signUpScreen:
        return CupertinoPageRoute(builder: (_) => const SignUpScreen());
      case AppRouteStrings.homeScreen:
        return CupertinoPageRoute(builder: (_) => const HomeScreen());
      case AppRouteStrings.bottomNav:
        return CupertinoPageRoute(
            builder: (_) => const CustomButtomNavigationBar());
      default:
        return CupertinoPageRoute(builder: (_) => const SizedBox());
    }
  }

  static void pushNamed({required String routeName, Object? arg}) {
    navKey.currentState?.pushNamed(routeName, arguments: arg);
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
