import 'package:flutter/material.dart';

import 'direction.dart';

class DirectionIntent extends Intent {
  final Direction direction;
  const DirectionIntent(this.direction);
}
