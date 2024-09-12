import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class TheApp extends StatelessWidget {
  const TheApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('The App'),
        ),
        body: const Center(
          child: Text('Hello, World!'),
        ),
        
      ),
    );
  }
}
