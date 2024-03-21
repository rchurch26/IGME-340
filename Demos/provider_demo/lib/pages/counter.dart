import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/counter_provider.dart';

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
              "${context.watch<CounterProvider>().counter}",
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
              context.read<CounterProvider>().increment();
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterProvider>().decrement();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}