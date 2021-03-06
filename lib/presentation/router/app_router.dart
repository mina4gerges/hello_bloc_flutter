import 'package:flutter/material.dart';
import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/second_screen.dart';
import '../../presentation/screens/third_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(title: 'Home Screen'),
        );
      case '/secondScreen':
        return MaterialPageRoute(
          builder: (_) => SecondScreen(title: 'Second Screen'),
        );
      case '/thirdScreen':
        return MaterialPageRoute(
          builder: (_) => ThirdScreen(title: 'Third Screen'),
        );
      default:
        return null;
    }
  }
}
