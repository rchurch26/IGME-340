import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimerDemo(),
    );
  }
}

class TimerDemo extends StatefulWidget {
  const TimerDemo({super.key});

  @override
  State<TimerDemo> createState() => _TimerDemoState();
}

class _TimerDemoState extends State<TimerDemo> {
  int mana = 0; 
  double money = 0.0;
  int manaPerSec = 1;
  double moneyPerSec = 0.1;
  late Timer manaTimer;
  late Timer moneyTimer;

  @override
  void initState() {
    super.initState();
    manaTimer = Timer.periodic(Duration(seconds: 1), (timer)
    {
      setState(() {
        mana += manaPerSec;
      });
    });
    moneyTimer = Timer.periodic(Duration(seconds: 1), (timer)
    {
      setState(() {
        money += moneyPerSec;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Timer Demo Page"),
        backgroundColor: Colors.blue,
      ),
        body: Column(
          children: [
            const Text(
              "World of Timers",
              style: TextStyle(fontSize: 30),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.amber,
                    height: 100,
                    child: Center(
                      child: Text(
                        "$mana",
                         style: const TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    height: 100,
                    child: Center(
                      child: Text(
                        "\$${money.toStringAsFixed(2)}",
                         style: const TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ],
            ), 
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Timer(const Duration(seconds: 3), () {
                  setState(() {
                    mana += 300;
                    money += 300;
                  });
                });
              }, 
              child: const Text("Bonus in 3 seconds"),
            ),  
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Mana stopped"))
                );
                manaTimer.cancel();
              }, 
              child: const Text("Stop Mana Timer")
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Mana started"))
                );
                manaTimer.cancel();
              }, 
              child: const Text("Start Mana Timer")
            ),   
          ],
        ),
      );
  }
}
