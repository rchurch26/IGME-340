import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

String postsUrl;

class JItem
{
  final int id;
  final String title;

  JItem({required this.id, required this.title});
}

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DemoPage(),
    );
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      );
  }
}

Future<List<JItem>> getData() async
{
  List<JItem> posts = [];
  var response = await http.get(Uri.parse(postsUrl));

  if(response.statusCode == 200)
  {
    var data = json.decode(response.body);
    for(var item in data)
    {
      posts.add(
        JItem(id: item[id], title: title)
      )
    }
  }
}
