import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/username_provider.dart';

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
          context.watch<UsernameProvider>().username, 
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}