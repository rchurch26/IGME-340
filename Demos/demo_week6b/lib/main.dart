import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String apiPostUrl = "https://jsonplaceholder.typicode.com/posts";
List<Map> inventory = [
  {"name" : "Sword", "price" : 100},
  {"name" : "Spear", "price" : 75},
  {"name" : "Dagger", "price" : 0},
  {"name" : "Axe", "price" : 90},
  {"name" : "Crossbow", "price" : 200},
];
List<dynamic> posts = [];

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
  State<DemoApp> createState() => __DemoAppState();
}

class __DemoAppState extends State<DemoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            child: ListView.builder(
              itemCount: inventory.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    trailing: Text("\$ ${inventory[index]["price"]}"),
                    minVerticalPadding: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    tileColor: Colors.blueGrey[100],
                    title: Text(inventory[index]["name"]),
                    subtitle: Text("Price: ${inventory[index]["price"]}"),
                    onTap: () {
                      print("You selected ${inventory[index]["name"]}");
                    }
                  ),
                );
              }),
            ),
            ElevatedButton(
              onPressed: () async {
                print("Button Pressed!");
                String retData = await sumNum(20, 30);
                print("retData: $retData");
                setState(() {
                  addedVal = retData;
                });
              }, 
              child: const Text("Do da ting"),
            ),
        ],
      ),
      );
  }
}

Future<String> sumNum (int a, int b)
{
  
}

Future<List> goGetPosts() async 
{
  var data = [];
  var response = await http.get(Uri.parse(apiPostUrl));
  if (response.statusCode == 200) {
    print("Got it");
    data = jsonDecode(response.body);
  }
  else{
    print("Dropped it");
  }
  return data;
}
