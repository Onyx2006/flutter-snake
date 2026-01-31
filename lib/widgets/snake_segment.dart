import 'package:flutter/material.dart';

class SnakeSegment extends StatelessWidget {
  final double cellSize;
  final bool isHead;

  const SnakeSegment({
    super.key,
    required this.cellSize,
    this.isHead = false,
  });

  @override
  Widget build(BuildContext context) {
    String assetPath = isHead
        ? 'assets/images/snake_head.png'
        : 'assets/images/snake_body.png';

    return Image.asset(
      assetPath,
      width: cellSize,
      height: cellSize,
    );
  }
}