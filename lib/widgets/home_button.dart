import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double iconSize;

  const HomeButton({super.key, required this.onPressed, this.iconSize = 24.0});

  @override
  Widget build(BuildContext context) => IconButton(
    onPressed: onPressed,
    icon: Icon(Icons.home, size: iconSize),
  );
}
