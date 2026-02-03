import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../models/direction.dart';
import '../models/food.dart';
import '../models/snake.dart';

class GameController extends ChangeNotifier {
  static const int rows = 10;
  static const int cols = 10;
  static const Duration tickDuration = Duration(milliseconds: 180);

  late Snake _snake;
  late Food _food;
    Timer? _timer;

  int _score = 0;
  bool _gameOver = false;

  int get score => _score;
  Snake get snake => _snake;
  Food get food => _food;
  bool get isGameOver => _gameOver;

  GameController() {
    _resetGame();
    _startLoop();
  }

  void _resetGame() {
    _timer?.cancel();
    _score = 0;
    _gameOver = false;

    final head = Point<int>(cols ~/ 2, rows ~/ 2);
    _snake = Snake(
      body: <Point<int>>[
        head,
        Point<int>(head.x - 1, head.y),
      ],
      direction: Direction.right,
    );

    _food = Food(rows: rows, cols: cols);

    notifyListeners();
  }

  void _startLoop() {
    _timer?.cancel();
    _timer = Timer.periodic(tickDuration, (_) => _tick());
  }

  void _tick() {
    if (_gameOver) return;

    final nextHead = _snake.nextHead();
    final willEat = nextHead == _food.position;

    _snake.move(grow: willEat);

    final hitWall = _snake.hitsWall(cols, rows);
    final hitSelf = _snake.hitsItself();
    if (hitWall || hitSelf) {
      _timer?.cancel();
      _gameOver = true;

      notifyListeners();
      return;
      }

    if (willEat) {
      _score += 1;
      _food.eaten(_snake.body);
    }

    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
