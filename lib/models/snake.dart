import 'dart:math';
import 'direction.dart';

// En dart no existe public, private, protected como en java
// Todo por defecto es public, y si quiero algo private se añade _ al nombre de la método/funcion/propiedad

class Snake {
  List<Point<int>> body;
  Direction direction;

  Snake({required this.body, required this.direction});

  Point<int> get head => body.first;

  void move({bool grow = false}) {
    final newHead = nextHead();

    body.insert(0, newHead);

    if (!grow) {
      body.removeLast();
    }
  }

  /// Calcula la siguiente posición de la cabeza
  Point<int> nextHead() {
    switch (direction) {
      case Direction.up:
        return Point(head.x, head.y - 1);
      case Direction.down:
        return Point(head.x, head.y + 1);
      case Direction.left:
        return Point(head.x - 1, head.y);
      case Direction.right:
        return Point(head.x + 1, head.y);
    }
  }

  // Colision
  bool hitsWall(int boardWidth, int boardHeight) {
    return head.x < 0 ||
        head.y < 0 ||
        head.x >= boardWidth ||
        head.y >= boardHeight;
  }

  bool hitsItself() {
    final headPosition = head;
    return body.skip(1).any((segment) => segment == headPosition);

    // En java lo haría asi pero en dart se ve más sencillo con methodos:
    // for (int i = 1; i < body.size(); i++) {
    // if (body.get(i).equals(headPosition)) {
    // return true;
    // }
    // }
    // return false;
  }

  // Evito que se pueda hacer esto: "-> <-" o "arriba abajo"
  void changeDirection(Direction newDirection) {
    if (_isOppositeDirection(newDirection)) return;
    direction = newDirection;
  }

  bool _isOppositeDirection(Direction newDirection) {
    return (direction == Direction.up && newDirection == Direction.down) ||
        (direction == Direction.down && newDirection == Direction.up) ||
        (direction == Direction.left && newDirection == Direction.right) ||
        (direction == Direction.right && newDirection == Direction.left);
  }
}
