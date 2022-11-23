import 'package:flutter/material.dart';
import 'package:sesion9/screens/index.dart';

class MyRoutes {
  static const String rLOGIN = '/login';
  static const String rHOME = '/home';
  static const String rSETTINGS = '/settings';
  static const String rPROFILE = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const Login());
      case '/home':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/settings':
        return MaterialPageRoute(builder: (_) => const Config());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const Profile());
      default:
        return MaterialPageRoute(builder: (_) => const Home());
    }
  }
}
