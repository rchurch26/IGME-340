import 'package:flutter/material.dart';
import '/pages/home.dart';
import '/pages/counter.dart';
import '/pages/settings.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({super.key});

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  int curTab = 0;
  final screens = 
  [
    const Home(),
    const Settings(),
    const Counter(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[curTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Counter",
          ),
        ],
        onTap: (index) {
          setState(() {
            curTab = index;
          });
        },
      ),
    );
  }
}