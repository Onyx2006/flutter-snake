import 'package:flutter/material.dart';

class FoodWidget extends StatelessWidget {
  final double cellSize;

  const FoodWidget({super.key, 
  required this.cellSize});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/manzana.png',
      width: cellSize,
      height: cellSize,
    );
  }
}