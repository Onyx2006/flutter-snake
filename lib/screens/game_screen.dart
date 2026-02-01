import 'package:flutter/material.dart';

import '../widgets/bar.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Snake Game';

    return Scaffold(
      appBar: Bar(title: appTitle),
      body: Stack(children: [Center(child: Text('Game in progress...'))]),
    );
  }
}
