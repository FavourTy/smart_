import 'package:flutter/cupertino.dart';
import 'package:weather_app/features/screens/home_screen/views/home_screen.dart';
import 'package:weather_app/features/screens/weather_details_screen/weather_details_screen.dart';

import 'app_route_strings.dart';

class AppRouter {
  static final navKey = GlobalKey<NavigatorState>();

  static Route appRouter(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteStrings.base:
        return CupertinoPageRoute(builder: (_) => const HomeScreen());
      case AppRouteStrings.weatherDetailScreen:
        return CupertinoPageRoute(builder: (_) => const WeatherDetailsScreen());
      default:
        return CupertinoPageRoute(builder: (_) => const SizedBox());
    }
  }

  static void pushNamed({required String routeName, Object? arg}) {
    navKey.currentState?.pushNamed(routeName, arguments: arg);
  }
}
