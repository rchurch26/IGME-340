import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
        title: const Text("IGME-340 Basic App"),
      ),
      body: Container(
        child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                height: 200,
                child: Text("Box 1"),
                color: Colors.orange,
              ),
              Container(
                alignment: Alignment.center,
                height: 200,
                child: Text("Box 2"),
                color: Colors.blue[300],
              ),
              Container(
                alignment: Alignment.center,
                height: 200,
                child: Text("Box 3"),
                color: Colors.grey,
              ),
              Container(
                alignment: Alignment.center,
                height: 200,
                child: Text("Box 4"),
                color: Colors.red,
              ),
              Container(
                alignment: Alignment.center,
                height: 200,
                child: Text("Box 5"),
                color: Colors.green,
              ),
              Container(
                alignment: Alignment.center,
                height: 200,
                child: Text("Box 6"),
                color: Colors.pink,
              ),
              Container(
                alignment: Alignment.center,
                height: 200,
                child: Text("Box 7"),
                color: Colors.purple,
              ),
              Container(
                alignment: Alignment.center,
                height: 200,
                child: Text("Box 8"),
                color: Colors.yellow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
