import 'package:flutter/material.dart';

import '../../features/home/presentation/screen/home_screen.dart';
import '../../features/quiz/presentation/screen/quiz_screen.dart';
import '../shared/screen/choose_difficulty_screen.dart';

class MyRouter {
  // DEFINING ROUTES HERE:
  static const String routeHome = '/home';
  static const String chooseDifficulty = '/choose-difficulty';
  static const String quiz = '/quiz';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    late Widget Function(BuildContext) screenDestination;
    Map<String, dynamic>? arguments;

    if (settings.arguments != null) {
      arguments = settings.arguments as Map<String, dynamic>;
    }

    switch (settings.name) {
      case routeHome:
        screenDestination = (_) => const HomeScreen();
        break;
      case chooseDifficulty:
        screenDestination = (_) => ChooseDifficultyScreen(
              category: arguments?['category'],
            );
        break;
      case quiz:
        screenDestination = (_) => QuizScreen(
              category: arguments?['category'],
              difficulty: arguments?['difficulty'],
            );
        break;

      default:
        screenDestination = (_) => const HomeScreen();
        break;
    }

    return MyCustomRoute(builder: screenDestination, settings: settings);
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({
    required super.builder,
    required RouteSettings super.settings,
  });

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (settings.arguments != null &&
        (settings.arguments as Map<String, dynamic>)['withAnimation'] == true) {
      // Fades between routes. (If you don't want any animation,
      return FadeTransition(opacity: animation, child: child);
    }
    // just return child.)
    return child;
  }
}
