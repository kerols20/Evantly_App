import 'package:evanly/core/constant/app_color.dart';
import 'package:flutter/material.dart';

abstract class appTheme{
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
      backgroundColor: app_color.appColorGeneral,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
    )
  );
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Color(0xff101127),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        backgroundColor: app_color.appColorGeneral,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      )
  );

}