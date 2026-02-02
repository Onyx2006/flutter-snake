import 'package:flutter/material.dart';
import 'dart:math';

class BoardWidget extends StatelessWidget {
  final int rows;
  final int cols;
  final double cellSize;

  final List<Point<int>> snake;
  final Point<int> food; 

  const BoardWidget({
    super.key,
    required this.rows,
    required this.cols,
    required this.cellSize,
    required this.snake,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              left: snake[i].x * cellSize,
              top: snake[i].y * cellSize,
              child: Image.asset(
                i == 0
                    ? 'assets/images/snake_head.png'
                    : 'assets/images/snake_body.png',
                width: cellSize,
                height: cellSize,
              ),
            ),
        ],
      ),
    );
  }
}