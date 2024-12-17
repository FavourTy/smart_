import 'package:flutter/material.dart';
import 'package:mini_project_1/navigation/app_route_strings.dart';

import 'navigation/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: AppRouter.navKey,
      theme: ThemeData(
        useMaterial3: true,
      ),
      onGenerateRoute: AppRouter.appRouter,
      initialRoute: AppRouteStrings.base,
    );
  }
}
