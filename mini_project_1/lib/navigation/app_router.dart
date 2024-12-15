import 'package:flutter/cupertino.dart';
import 'package:mini_project_1/navigation/app_route_strings.dart';
import 'package:mini_project_1/screens/home_page.dart';
import 'package:mini_project_1/screens/result_page.dart';

class AppRouter {
  static final navKey = GlobalKey<NavigatorState>();

  static Route appRouter(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteStrings.base:
        return CupertinoPageRoute(builder: (_) => const HomePage());
      case AppRouteStrings.resultpage:
        return CupertinoPageRoute(builder: (_) => const Resultpage());
      default:
        return CupertinoPageRoute(builder: (_) => const SizedBox());
    }
  }

  static void pushNamed({required String routeName, Object? arg}) {
    navKey.currentState?.pushNamed(routeName, arguments: arg);
  }
}
