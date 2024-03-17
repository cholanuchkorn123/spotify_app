import 'package:flutter/material.dart';

class AppTheme {
  static const blackColor = Color(0xff030303);
  static const fontBottomNav = TextStyle(fontSize: 12);
  static final darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: blackColor,
    textTheme: const TextTheme(),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white10,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: fontBottomNav,
        unselectedLabelStyle: fontBottomNav,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38),
  );
}
