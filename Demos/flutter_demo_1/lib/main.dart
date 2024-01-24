import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Hello World App",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        appBarTheme: AppBarTheme(backgroundColor: Colors.pink[100]),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.purple,
        appBarTheme: AppBarTheme(backgroundColor: Colors.purple[100]),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello World App"),
        ),
        body: Center(
          child: Text("Hello World"),
        ),
      )
    ),
  );
}
