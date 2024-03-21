import 'package:flutter/material.dart';
import 'package:no_provider_demo/globals.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Page"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$counter",
              style: const TextStyle(
                fontSize: 80,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                counter--;
              });
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}