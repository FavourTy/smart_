import 'package:firebase_auth/firebase_auth.dart';
import 'package:floww/features/screens/authentication/view_models/authentication_provider.dart';
import 'package:floww/features/screens/authentication/views/sign_up_screen/sign_up_screen.dart';
import 'package:floww/features/screens/home/view_models/chat_provider.dart';

import 'package:floww/services/chat_services.dart';
import 'package:floww/services/firebase_services.dart';
import 'package:floww/shared/navigation/app_route_strings.dart';
import 'package:floww/shared/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final firebaseService = FirebaseServices();
    final chatServices = ChatServices();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              AuthenticationProvider(firebaseService: firebaseService),
        ),
        ChangeNotifierProvider(
            create: (_) => ChatProvider(chatservice: chatServices))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(scrolledUnderElevation: 0),
        ),
        navigatorKey: AppRouter.navKey,
        onGenerateRoute: AppRouter.appRouter,
        initialRoute: AppRouteStrings.base,
        // initialRoute: firebaseService.auth.currentUser != null
        //     ? AppRouteStrings.bottomNav
        //     : AppRouteStrings.loginScreen,
      ),
    );
  }
}
