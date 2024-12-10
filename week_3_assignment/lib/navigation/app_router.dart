// ignore_for_file: unreachable_switch_case

import 'package:flutter/cupertino.dart';
import 'package:week_3_assignment/navigation/app_route_strings.dart';
import 'package:week_3_assignment/screens/welcome_screen.dart';
import 'package:week_3_assignment/screens/sign_up_screen.dart';
import 'package:week_3_assignment/screens/login_screen.dart';

class AppRouter {
  static final navKey = GlobalKey<NavigatorState>();

  static Route appRouter(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteString.base:
        return CupertinoPageRoute(builder: (_) => const WelcomeScreen());
      case AppRouteString.signup_screen:
        return CupertinoPageRoute(builder: (_) => const SignUpScreen());
      case AppRouteString.login_screen:
        return CupertinoPageRoute(builder: (_) => const LogInScreen());
      default:
        return CupertinoPageRoute(builder: (_) => const SizedBox());
    }
  }

  static void pushNamed({required String routeName, Object? arg}) {
    navKey.currentState?.pushNamed(routeName, arguments: arg);
  }
}
