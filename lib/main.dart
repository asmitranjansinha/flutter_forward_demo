import 'package:flutter/material.dart';
import 'package:flutter_forward_demo/login.dart';
import 'package:flutter_forward_demo/signup_screen.dart';
import 'package:flutter_forward_demo/utils/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Auth App',
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: '/login',
    );
  }
}
