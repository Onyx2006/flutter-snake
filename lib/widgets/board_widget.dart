import 'dart:math';

import 'package:flutter/material.dart';

import '../models/direction.dart';
import 'package:flutter/services.dart';

class BoardWidget extends StatelessWidget {
  final int rows;
  final int cols;
  final double cellSize;

  final List<Point<int>> snake;
  final Point<int> food;
  final Direction headDirection;
  final ValueChanged<Direction> onDirectionChange;

  const BoardWidget({
    super.key,
    required this.rows,
    required this.cols,
    required this.cellSize,
    required this.snake,
    required this.food,
    required this.headDirection,
    required this.onDirectionChange,
  });

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      autofocus: true,
      shortcuts: const <ShortcutActivator, Intent>{
        SingleActivator(LogicalKeyboardKey.arrowUp): DirectionIntent(
          Direction.up,
        ),
        SingleActivator(LogicalKeyboardKey.keyW): DirectionIntent(Direction.up),
        SingleActivator(LogicalKeyboardKey.arrowDown): DirectionIntent(
          Direction.down,
        ),
        SingleActivator(LogicalKeyboardKey.keyS): DirectionIntent(
          Direction.down,
        ),
        SingleActivator(LogicalKeyboardKey.arrowLeft): DirectionIntent(
          Direction.left,
        ),
        SingleActivator(LogicalKeyboardKey.keyA): DirectionIntent(
          Direction.left,
        ),
        SingleActivator(LogicalKeyboardKey.arrowRight): DirectionIntent(
          Direction.right,
        ),
        SingleActivator(LogicalKeyboardKey.keyD): DirectionIntent(
          Direction.right,
        ),
      },
      actions: <Type, Action<Intent>>{
        DirectionIntent: CallbackAction<DirectionIntent>(
          onInvoke: (intent) {
            onDirectionChange(intent.direction);
            return null;
          },
        ),
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanEnd: (details) {
          final v = details.velocity.pixelsPerSecond;
          if (v.distance < 150) return;

          if (v.dx.abs() > v.dy.abs()) {
            onDirectionChange(v.dx > 0 ? Direction.right : Direction.left);
          } else {
            onDirectionChange(v.dy > 0 ? Direction.down : Direction.up);
          }
        },
        child: SizedBox(
          width: cols * cellSize,
          height: rows * cellSize,
          child: Stack(
            children: [
              // Board
              for (int y = 0; y < rows; y++)
                for (int x = 0; x < cols; x++)
                  Positioned(
                    left: x * cellSize,
                    top: y * cellSize,
                    child: Image.asset(
                      (x + y) % 2 == 0
                          ? 'assets/images/tile1.png'
                          : 'assets/images/tile2.png',
                      width: cellSize,
                      height: cellSize,
                      fit: BoxFit.cover,
                    ),
                  ),

              // Apple
              Positioned(
                left: food.x * cellSize,
                top: food.y * cellSize,
                child: Image.asset(
                  'assets/images/apple.png',
                  width: cellSize,
                  height: cellSize,
                ),
              ),

              // Snake
              for (int i = 0; i < snake.length; i++)
                Positioned(
                  left: i == 0
                      ? snake[i].x * cellSize
                      : snake[i].x * cellSize +
                            (1 - _scaleSegment(i, snake.length)) *
                                0.5 *
                                cellSize,
                  top: i == 0
                      ? snake[i].y * cellSize
                      : snake[i].y * cellSize +
                            (1 - _scaleSegment(i, snake.length)) *
                                0.5 *
                                cellSize,
                  child: i == 0
                      ? Transform.rotate(
                          angle: _angleForDirection(headDirection),
                          child: Image.asset(
                            'assets/images/snake_head.png',
                            width: cellSize,
                            height: cellSize,
                          ),
                        )
                      : Builder(
                          builder: (_) {
                            return Image.asset(
                              'assets/images/snake_body.png',
                              width: cellSize * _scaleSegment(i, snake.length),
                              height: cellSize * _scaleSegment(i, snake.length),
                            );
                          },
                        ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class DirectionIntent extends Intent {
  final Direction direction;
  const DirectionIntent(this.direction);
}

double _angleForDirection(Direction d) {
  switch (d) {
    case Direction.right:
      return -pi / 2;
    case Direction.down:
      return 0;
    case Direction.left:
      return pi / 2;
    case Direction.up:
      return pi;
  }
}

double _scaleSegment(int index, int totalSegments) {
  final minScale = 0.6;
  final scaleRange = 1.0 - minScale;
  final scaleStep = scaleRange / totalSegments;

  return 1.0 - (index * scaleStep);
}
