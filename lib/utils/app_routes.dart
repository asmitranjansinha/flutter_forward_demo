import 'package:flutter/material.dart';
import 'package:flutter_forward_demo/home_screen.dart';
import 'package:flutter_forward_demo/login.dart';
import 'package:flutter_forward_demo/signup_screen.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      case '/signup':
        return MaterialPageRoute(builder: (context) => const SignUpScreen());

      case '/home':
        return MaterialPageRoute(builder: (context) => HomeScreen());
    }
    return null;
  }
}
