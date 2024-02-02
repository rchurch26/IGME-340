import 'package:flutter/material.dart';
import 'styles.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Light Theme
      themeMode: ThemeMode.light,
      theme: lightTheme(context),
      //Dark Theme
      darkTheme: darkTheme(context),
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button & Theme"),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              "Hello World!",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Container(
            color: Colors.green,
            alignment: Alignment.center,
            height: 200,
            width: 200,
            child: Text(
              "I am Container",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 20,
            //   ),
            // ),
            // decoration: BoxDecoration(
            //   color: Colors.red,
            //   borderRadius: BorderRadius.circular(20),
              ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {}, 
            child: Text("Click Me"),
            // style: ElevatedButton.styleFrom(
            //   elevation: 10,
            //   backgroundColor: Colors.red,
            //   foregroundColor: Colors.white,
            //   padding: EdgeInsets.all(20),
            //   side: BorderSide(
            //     color: Colors.black,
            //     width: 5,
            //   ),
            //   textStyle: TextStyle(
            //     fontSize: 30,
            //   ),
            // ),
          ),
          ElevatedButton(
            onPressed: () {}, 
            child: Text("Click Me 2"),
          ),
          OutlinedButton(
            onPressed: () {}, 
            child: Text("Click Outlined Button"),
          ),
          TextButton(
            onPressed: () {}, 
            child: Text("Click Text Button"),
            )
        ],
      )
    );
  }
}