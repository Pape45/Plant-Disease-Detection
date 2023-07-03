import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Screen'),
      ),
      body: const Center(
        child: Text(
          'Bienvenue dans l\'écran de test!',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
