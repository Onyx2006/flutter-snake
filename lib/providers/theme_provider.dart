import 'package:flutter/material.dart';

// NOTE(srvariable): Added WidgetsBindingObserver to listen to system brightness changes
class ThemeProvider extends ChangeNotifier with WidgetsBindingObserver {
  ThemeMode _mode = ThemeMode.system;
  // The brightness of ThemeMode.system (light/dark)
  Brightness _systemBrightness =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;

  ThemeProvider() {
    WidgetsBinding.instance.addObserver(this);
  }

  ThemeMode get mode => _mode;

  bool get isDark {
    if (_mode == ThemeMode.system) {
      return _systemBrightness == Brightness.dark;
    }
    return _mode == ThemeMode.dark;
  }

  void setTheme(ThemeMode mode) {
    _mode = mode;
    notifyListeners();
  }

  void toggle() {
    _mode = isDark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  void setSystem() {
    _mode = ThemeMode.system;
    notifyListeners();
  }

  // Check if the user changes the system brightness
  @override
  void didChangePlatformBrightness() {
    _systemBrightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    _mode = ThemeMode.system;
    notifyListeners();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
