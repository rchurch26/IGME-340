import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

Map<String, dynamic> jokes = {};

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WebApp(),
    );
  }
}

class WebApp extends StatefulWidget {
  const WebApp({super.key});

  @override
  State<WebApp> createState() => _WebAppState();
}

class _WebAppState extends State<WebApp> {
  String setup = "";
  String joke = "Laugh More!";
  final _myFormId = GlobalKey<FormState>();
  bool? nsfwChecked = false;

  var categoryOptions = [
    const DropdownMenuItem(
      value: "Any",
      child: Text("Any")
    ),
    const DropdownMenuItem(
      value: "Programming",
      child: Text("Programming")
    ),
    const DropdownMenuItem(
      value: "Misc",
      child: Text("Misc")
    ),
    const DropdownMenuItem(
      value: "Dark",
      child: Text("Dark")
    ),
    const DropdownMenuItem(
      value: "Pun",
      child: Text("Pun")
    ),
    const DropdownMenuItem(
      value: "Spooky",
      child: Text("Spooky")
    ),
    const DropdownMenuItem(
      value: "Christmas",
      child: Text("Christmas")
    ),
  ];

  @override
  void initState()
  {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quick Laugh",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  child: Form(
                    key: _myFormId,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                              labelText: "Category",
                              border: OutlineInputBorder(),
                            ),
                            items: [DropdownMenuItem(child: Text("Sample"))], 
                            onChanged: (value) {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                              labelText: "Depth",
                              border: OutlineInputBorder(),
                            ),
                            items: [DropdownMenuItem(child: Text("Sample"))], 
                            onChanged: (value) {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Contains",
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              CheckboxListTile(
                                title: const Text("NSFW"),
                                controlAffinity: ListTileControlAffinity.leading,
                                value: nsfwChecked,
                                onChanged: (value) {
                                  setState(() {
                                    nsfwChecked = value;
                                  });
                                },
                                checkColor: Colors.red,
                                activeColor: Colors.black,
                              ),
                              CheckboxListTile(
                                title: const Text("Religious"),
                                controlAffinity: ListTileControlAffinity.leading,
                                value: nsfwChecked,
                                onChanged: (value) {
                                  setState(() {
                                    nsfwChecked = value;
                                  });
                                },
                                checkColor: Colors.red,
                                activeColor: Colors.black,
                              ),
                              CheckboxListTile(
                                title: const Text("Political"),
                                controlAffinity: ListTileControlAffinity.leading,
                                value: nsfwChecked,
                                onChanged: (value) {
                                  setState(() {
                                    nsfwChecked = value;
                                  });
                                },
                                checkColor: Colors.red,
                                activeColor: Colors.black,
                              ),
                              CheckboxListTile(
                                title: const Text("Explicit"),
                                controlAffinity: ListTileControlAffinity.leading,
                                value: nsfwChecked,
                                onChanged: (value) {
                                  setState(() {
                                    nsfwChecked = value;
                                  });
                                },
                                checkColor: Colors.red,
                                activeColor: Colors.black,
                              ),
                            ],
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  jokes = await goGetJokes();
                  setState(() {
                    joke = jokes["joke"];
                  });
                }, 
                child: const Text("Make me laugh!"),
              ),
              Text(joke),
            ],
          ),
        ),
      );
  }
}

Future<dynamic> goGetJokes() async
{
  //Change link for user input
  //Ex: https://v2.jokeapi.dev/joke/$category?type=$depth&contains=$userContain
  String apiJokeUrl = "https://v2.jokeapi.dev/joke/Any?type=single";
  var data = {};
  var response = await http.get(Uri.parse(apiJokeUrl));
  if(response.statusCode == 200)
  {
    print("Got it");
    data = jsonDecode(response.body);
    print(data.runtimeType);
  }
  else
  {
    print("Dropped it");
  }
  return data;
}
