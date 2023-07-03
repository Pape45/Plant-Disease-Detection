import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Screen'),
      ),
      body: Center(
        child: Text(
          'Bienvenue dans l\'écran de test!',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
