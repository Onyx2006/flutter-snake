import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routing/routes.dart';
import '../widgets/bar.dart';
import '../widgets/start_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Snake Game';

    final isDesktop = MediaQuery.of(context).size.width > 600;
    final titleSize = isDesktop ? 48.0 : 36.0;
    final subtitleSize = isDesktop ? 20.0 : 16.0;

    return Scaffold(
      appBar: const Bar(title: appTitle),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/snake_head.png',
              width: 80,
              height: 80,
            ),
            const SizedBox(height: 20),
            Text(
              'SNAKE GAME',
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Legendario juego de la serpiente hecho con Flutter',
              style: TextStyle(fontSize: subtitleSize),
            ),
            const SizedBox(height: 40),
            StartButton(
              onPressed: () {
                context.go(Routes.game);
              },
            ),
          ],
        ),
      ),
    );
  }
}
