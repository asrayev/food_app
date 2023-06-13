import 'package:flutter/material.dart';
import 'package:food_app/ui/main/main_page.dart';
import 'package:food_app/ui/splash/splash_page.dart';

abstract class RouteName {
  static const mainPage = 'mainPage';
  static const splash = 'splash';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case RouteName.mainPage:
        return MaterialPageRoute(builder: (_) =>  const MainPage());

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}