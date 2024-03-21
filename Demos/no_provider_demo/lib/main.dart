import 'package:flutter/material.dart';
import 'package:no_provider_demo/skeleton.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Skeleton(),
    );
  }
}
