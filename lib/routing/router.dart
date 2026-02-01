import 'package:go_router/go_router.dart';

import 'routes.dart';
import '../screens/game_screen.dart';
import '../screens/game_over_screen.dart';
import '../screens/home_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: Routes.home,
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: Routes.game,
        builder: (context, state) {
          return const GameScreen();
        },
      ),
      GoRoute(
        path: Routes.gameOver,
        builder: (context, state) {
          return const GameOverScreen();
        },
      ),
    ],
  );
}
