import 'package:advance_task_manager/ui/shared/constants.dart';
import 'package:flutter/material.dart';

class Themes {
  static final lightTheme = ThemeData(
    // primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(
      backgroundColor: lightThemePrimaryColor,
    ),
    brightness: Brightness.light,
  );
  static final darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: darkThemePrimaryColor,
    ),
    brightness: Brightness.dark,
  );
}
