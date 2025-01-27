import 'package:floww/shared/navigation/app_route_strings.dart';
import 'package:floww/shared/navigation/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      navigatorKey: AppRouter.navKey,
      onGenerateRoute: AppRouter.appRouter,
      initialRoute: AppRouteStrings.signUpScreen,
    );
  }
}
