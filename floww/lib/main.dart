import 'package:floww/features/screens/authentication/view_models/authentication_provider.dart';
import 'package:floww/services/firebase_services.dart';
import 'package:floww/shared/navigation/app_route_strings.dart';
import 'package:floww/shared/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                AuthenticationProvider(firebaseService: FirebaseServices()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        navigatorKey: AppRouter.navKey,
        onGenerateRoute: AppRouter.appRouter,
        initialRoute: AppRouteStrings.loginScreen,
      ),
    );
  }
}
