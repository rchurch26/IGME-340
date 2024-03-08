import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DemoApp(),
    );
  }
}

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  final TextEditingController txt01 = TextEditingController();
  final TextEditingController txt02 = TextEditingController();
  String output = "";
  late SharedPreferences prefs;
  Map<String, dynamic> myMap = {

  };

  @override
  void initState()
  {
    super.initState();
    init();
  }

  Future init() async
  {
    prefs = await SharedPreferences.getInstance();
    txt01.text = prefs.getString("name") ?? "";
    txt02.text = prefs.getString("phone") ?? "";
    myMap = jsonDecode(prefs.getString("myMap") ?? "{}");
    output =  "Name: ${txt01.text}, Phone: ${txt02.text}";
  }

  @override
  void dispose()
  {
    super.dispose();
    txt01.dispose();
    txt02.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            children: [
              Text(output),
              TextField(
                controller: txt01,
                decoration: const InputDecoration(
                  labelText: "Enter Name:",
                ),
              ),
              TextField(
                controller: txt02,
                decoration: const InputDecoration(
                  labelText: "Enter Name:",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () async
              {
                await prefs.setString("name", txt01.text);
                await prefs.setString("phone", txt02.text);
                await prefs.setString("myMap", jsonEncode(myMap));
              }, 
              child: const Text("Save"),
              ),
            ],
          ),
        ),
      );
  }
}
