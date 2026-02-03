import 'package:flutter/material.dart';

abstract final class AppColors {
  // NOTE(srvariable): Colors are in ARGB format
  static const Color white = Color(0xFFDDDDDD);
  static const Color black = Color(0xFF222222);
  static const Color red = Colors.red;
  static const Color blue = Colors.blue;
  static const Color blue2 = Colors.blueAccent;

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: black,
    onPrimary: white,
    secondary: black,
    onSecondary: white,
    error: red,
    onError: white,
    surface: white,
    onSurface: black,
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: white,
    onPrimary: black,
    secondary: white,
    onSecondary: black,
    error: red,
    onError: black,
    surface: black,
    onSurface: white,
  );
}
