import 'dart:math';

class Food {
  late Point<int> position;
  final int rows;
  final int cols;
  final Random _random = Random();

  Food({
    required this.rows, 
    required this.cols
  }) 
  
  {
    _generateNewPosition([]);
  }


  // New positon while snake isn't on the food
  void _generateNewPosition(List<Point<int>> snakeBody) {
    Point<int> newPos;
    do {
      newPos = Point(
        _random.nextInt(cols),
        _random.nextInt(rows),
      );
    } while (snakeBody.contains(newPos));
    position = newPos;
  }


  void eaten(List<Point<int>> snakeBody) {
    _generateNewPosition(snakeBody);
  }
}