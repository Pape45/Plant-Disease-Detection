import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map en construction'),
      ),
      body: const Center(
        child: Text(
          'Map en construction...',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
