import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:saur_admin/screen/home_container/home_container.dart';
import 'package:saur_admin/screen/user_onboarding/login_screen.dart';
import 'package:saur_admin/utils/router.dart';
import 'package:saur_admin/utils/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  prefs = await SharedPreferences.getInstance();

  FlutterNativeSplash.remove();
  // runApp(const MyApp());
  runZonedGuarded(() async {
    runApp(const MyApp()); // starting point of app
  }, (error, stackTrace) {});
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sudarshan Saur | Admin Portal',
      theme: globalTheme(context),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      navigatorKey: navigatorKey,
      onGenerateRoute: NavRoute.generatedRoute,
    );
  }
}
