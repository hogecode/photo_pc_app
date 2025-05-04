import 'package:go_router/go_router.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: '/detail',
        builder: (context, state) {
          final imagePath = state.extra as String;
          return DetailScreen(imagePath: imagePath);
        },
      ),
    ],
  );
}
