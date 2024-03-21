import 'package:flutter/material.dart';
import '../globals.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Text(
          username, 
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}