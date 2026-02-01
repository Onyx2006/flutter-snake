import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class SwitchThemeButton extends StatelessWidget {
  final double iconSize;
  const SwitchThemeButton({super.key, this.iconSize = 24.0});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    final isDark = theme.isDark;

    return IconButton(
      icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode, size: iconSize),
      onPressed: theme.toggle,
      tooltip: 'Toggle to ${isDark ? 'light' : 'dark'} mode',
    );
  }
}
