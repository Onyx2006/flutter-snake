import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../widgets/bar.dart';
import '../widgets/board_widget.dart';
import '../widgets/score_widget.dart';
import '../controllers/game_controller.dart';
import '../routing/routes.dart';

class GameScreen extends StatelessWidget {
  static const String _title = 'Snake Game';

  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameController(),
      builder: (context, _) {
        final controller = context.watch<GameController>();

        if (controller.isGameOver) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            GoRouter.of(context).go(Routes.gameOver, extra: controller.score);
          });
        }

        return Scaffold(
          appBar: const Bar(title: _title),
          body: Column(
            children: [
              ScoreWidget(score: controller.score),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final cellSize =
                        (constraints.biggest.shortestSide * 0.9) /
                        GameController.rows;
                    return Center(
                      child: BoardWidget(
                        rows: GameController.rows,
                        cols: GameController.cols,
                        cellSize: cellSize,
                        snake: controller.snake.body,
                        food: controller.food.position,
                        headDirection: controller.snake.direction,
                        onDirectionChange: controller.snake.changeDirection,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
