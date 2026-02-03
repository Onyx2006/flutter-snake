import 'package:flutter/material.dart';
import 'package:flutter_snake/themes/themes.dart';
import 'package:provider/provider.dart';

import 'providers/theme_provider.dart';
import 'routing/router.dart';

// TODO(srvariable): Check if there's a better way to handle responsive
// screens/game_over_screen.dart
// widgets/bar.dart
// widgets/retry_button.dart

void main() => runApp(
  ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MainApp(),
  ),
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();

    return MaterialApp.router(
      // To remove the debug banner
      debugShowCheckedModeBanner: false,

      routerConfig: AppRouter.router,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: theme.mode,
    );
  }
}
