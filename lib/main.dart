import 'package:flutter/material.dart';
import 'package:flutter_forward_demo/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth App',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
