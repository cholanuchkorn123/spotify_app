import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:spotify_app/utils/config/app_binding.dart';
import 'package:spotify_app/utils/config/app_route.dart';
import 'package:spotify_app/utils/config/app_theme.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      title: 'Spotify App',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.mainTabBar,
      initialBinding: AppBinding(),
      getPages: AppRoute.generatedGetPages,
      defaultTransition: Transition.fade,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppTheme.blackColor,
      ),
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
