import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text(
          "Welcome! You have made it Home!",
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
