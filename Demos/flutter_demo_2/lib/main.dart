import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DemoApp()
    );
  }
}

class DemoApp extends StatefulWidget
{
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text(
          "Demo App"
        ),
      ),
      //ignore: prefer_const_constructors
      body: Container(
        color: Colors.red,
        width: double.infinity,
        height: double.infinity,
        child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container01(),
              Container(
                alignment: Alignment.centerLeft,
                width: 200,
                height: 200,
                color: Colors.yellow[100],
                child: Text("I am a Container 2"),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: 200,
                height: 400,
                color: Colors.purple[100],
                child: Text("I am a Container 3"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container Container01() {
    return Container(
              alignment: Alignment.centerLeft,
              width: 200,
              height: 200,
              color: Colors.blue[100],
              child: Text("I am a Container"),
            );
  }
}