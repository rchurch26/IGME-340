import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget 
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> 
{
  String text01 = "Button 1";
  String text02 = "Button 2";
  String text03 = "Button 3";
  int count01 = 0;
  int count02 = 0;
  int count03 = 0;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Week4A"),
        backgroundColor: Colors.blueGrey[200],
        elevation: 20,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 20.0,
          ),
          child: Icon(
            Icons.info_outline_rounded,
            size: 30,
            color: Colors.amberAccent,
            shadows: [
              Shadow(
                blurRadius: 10, 
                color: Colors.red,
                offset: Offset(3, 3),
              )
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print("Search Button Pressed!");
            }, 
            icon: Icon(Icons.search_rounded),
          ),
          IconButton(
            onPressed: () {
              print("SOMETHING ELSE");
            }, 
            icon: Icon(Icons.all_inbox),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: 
          [
            ElevatedButton(
              onPressed: btn01_pressed, 
              child: Text(text01),
              ),
            ElevatedButton(
              onPressed: btn02_pressed, 
              child: Text(text02),
              ),
            ElevatedButton(
              onPressed: btn03_pressed, 
              child: Text(text03),
              ),
              SizedBox(height: 30,),
              Text("Button 1 count: $count01"),
              Text("Button 2 count: $count02"),
              Text("Button 3 count: $count03"),
          ]
        ),
      ),
    );
  }

  void btn01_pressed()
  {
    setState(() {
      count01++;
      print("Button 1 pressed = $count01");
    });
  }

  void btn02_pressed()
  {
    setState(() {
      count02 += 2;
      print("Button 2 pressed = $count02");
    });
  }

  void btn03_pressed()
  {
    setState(() {
      count03 += 10;
      print("Button 3 pressed = $count03");
    });
  }
}