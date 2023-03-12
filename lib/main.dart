import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_forward_demo/login.dart';
import 'package:flutter_forward_demo/signup_screen.dart';
import 'package:flutter_forward_demo/utils/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth App',
      debugShowCheckedModeBanner: false,
      home: const SignUpScreen(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: _auth.currentUser == null ? '/login' : '/home',
    );
  }
}
