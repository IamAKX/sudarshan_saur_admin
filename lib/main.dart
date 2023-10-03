import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:saur_admin/screen/home_container/home_container.dart';
import 'package:saur_admin/screen/user_onboarding/login_screen.dart';
import 'package:saur_admin/utils/router.dart';
import 'package:saur_admin/utils/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services/api_service.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  prefs = await SharedPreferences.getInstance();

  FlutterNativeSplash.remove();
  // runApp(const MyApp());
  HttpOverrides.global = MyHttpOverrides();

  runZonedGuarded(() async {
    runApp(const MyApp()); // starting point of app
  }, (error, stackTrace) {});
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ApiProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Sudarshan Saur | Admin Portal',
        theme: globalTheme(context),
        debugShowCheckedModeBanner: false,
        home: const HomeContainer(),
        navigatorKey: navigatorKey,
        onGenerateRoute: NavRoute.generatedRoute,
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) {
        final isValidHost =
            ["icrmonline.in"].contains(host); // <-- allow only hosts in array
        return isValidHost;
      });
  }
}
