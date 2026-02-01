import 'package:flutter/material.dart';
import 'colors.dart';

abstract final class AppThemes {
  static final lightTheme = ThemeData(
    colorScheme: AppColors.lightColorScheme,
    useMaterial3: true,
  );

  static final darkTheme = ThemeData(
    colorScheme: AppColors.darkColorScheme,
    useMaterial3: true,
  );
}
