import 'package:flutter/material.dart';
import 'dart:math';

import '../widgets/bar.dart';
import '../widgets/board_widget.dart';
import '../widgets/score_widget.dart';
import '../models/direction.dart';
import '../models/food.dart';
import '../models/snake.dart';

class GameScreen extends StatelessWidget {
  static const String _title = 'Snake Game';
  static const int _score = 69;
  static const int _rows = 10;
  static const int _cols = 10;
  static final Snake _snake = Snake(
    body: <Point<int>>[
      Point<int>(_rows ~/ 2, _cols ~/ 2),
      Point<int>(_rows ~/ 2, _cols ~/ 2 - 1),
    ],
    direction: Direction.right,
  );
  static final Food _food = Food(rows: _rows, cols: _cols);

  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Bar(title: _title),
      body: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final cellSize =
                    (constraints.biggest.shortestSide * 0.9) / _rows;
                return Center(
                  child: BoardWidget(
                    rows: _rows,
                    cols: _cols,
                    cellSize: cellSize,
                    snake: _snake.body,
                    food: _food.position,
                  ),
                );
              },
            ),
          ),
          ScoreWidget(score: _score),
        ],
      ),
    );
  }
}
