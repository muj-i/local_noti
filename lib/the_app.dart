import 'package:flutter/material.dart';

class TheApp extends StatelessWidget {
  const TheApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The App'),
      ),
      body: const Center(
        child: Text('Hello, World!'),
      ),
    );
  }
}
