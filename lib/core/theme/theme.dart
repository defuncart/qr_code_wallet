import 'package:flutter/material.dart';

class LightTheme {
  LightTheme._();

  static ThemeData generate({Color? primaryColor}) =>
      primaryColor != null ? ThemeData.from(colorScheme: ColorScheme.light(primary: primaryColor)) : ThemeData.light();
}

class DarkTheme {
  DarkTheme._();

  static ThemeData generate({Color? primaryColor}) =>
      primaryColor != null ? ThemeData.from(colorScheme: ColorScheme.dark(primary: primaryColor)) : ThemeData.dark();
}
