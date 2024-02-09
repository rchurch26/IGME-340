import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IGME-340: Themes"),
      ),
      body: Column(
        
        children: [
          Container(
            width: 300,
            height: 200,
            color: Colors.green,
            child: Text("I am Green"),
          ),
          Container(
            width: 200,
            height: 200,
            color: Colors.yellow,
            child: Text("I am Yellow"),
          ),
          Container(
            width: 350,
            height: 100,
            color: Colors.pink,
            child: Text("I am Pink"),
          ),
          ElevatedButton(
            onPressed: () {
            },
            child: const Text('Elevated Button'),
          )
        ],
      ),
    );
  }
}
