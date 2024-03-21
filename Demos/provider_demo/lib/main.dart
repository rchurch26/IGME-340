import 'package:flutter/material.dart';
import 'providers/username_provider.dart';
import 'providers/counter_provider.dart';
import 'skeleton.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider<CounterProvider>(
    //   create: (context) => CounterProvider(),
    //   child: const MaterialApp(
    //     home: Skeleton(),
    //   ),
    // );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterProvider>(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider<UsernameProvider>(
          create: (context) => UsernameProvider(),
        ),
      ],
      child: const MaterialApp(
        home: Skeleton(),
      ),
    );
  }
}
