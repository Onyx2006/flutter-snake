import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/colors.dart';
import '../providers/theme_provider.dart';

class StartButton extends StatelessWidget {
  final VoidCallback onPressed;

  const StartButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    final isDark = theme.isDark;

    final isDesktop = MediaQuery.of(context).size.width > 600;

    final buttonWidth = isDesktop ? 240.0 : 150.0;
    final buttonHeight = isDesktop ? 60.0 : 50.0;
    final fontSize = isDesktop ? 24.0 : 18.0;

    final backgroundColor = isDark ? AppColors.blue2 : AppColors.blue;
    final backgroundColorHover = isDark ? AppColors.blue : AppColors.blue2;

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
        foregroundColor: WidgetStatePropertyAll(AppColors.white),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          bool isHover = states.contains(WidgetState.hovered);
          bool isPressed = states.contains(WidgetState.pressed);
          bool isFocused = states.contains(WidgetState.focused);
          if (isHover || isPressed || isFocused) {
            return backgroundColorHover;
          }
          return null;
        }),
        minimumSize: WidgetStatePropertyAll(Size(buttonWidth, buttonHeight)),
      ),
      child: Text('Start', style: TextStyle(fontSize: fontSize)),
    );
  }
}
