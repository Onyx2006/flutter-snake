import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routing/routes.dart';
import '../widgets/bar.dart';
import '../widgets/retry_button.dart';

class GameOverScreen extends StatelessWidget {
  const GameOverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Game Over';
    const int score = 12;

    final isDesktop = MediaQuery.of(context).size.width > 600;
    final fontSize = isDesktop ? 30.0 : 24.0;

    return Scaffold(
      appBar: Bar(title: appTitle),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Score: $score', style: TextStyle(fontSize: fontSize)),
            const SizedBox(height: 20),
            RetryButton(
              onPressed: () {
                GoRouter.of(context).go(Routes.game);
              },
            ),
          ],
        ),
      ),
    );
  }
}
