import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map<String, dynamic> jokes = {};
String apiJokeUrl = "";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.amber),
        )
      ),
      home: const WebApp(),
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
  bool nsfwChecked = false;
  bool religiousChecked = false;
  bool politicalChecked = false;
  bool explicitChecked = false;
  TextEditingController containController = TextEditingController();
  late SharedPreferences prefs;

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
  var depthOptions = [
    const DropdownMenuItem(
      value: "Single",
      child: Text("Single")
    ),
    const DropdownMenuItem(
      value: "TwoPart",
      child: Text("Two Part")
    ),
  ];

  String? selectedCategory = "Any";
  String? selectedDepth = "Single";

  late FocusNode containNode;

  @override
  void initState()
  {
    super.initState();
    containNode = FocusNode();
    containController.addListener(() {
      print("Contain: ${containController.text}");
    });
    init();
  }

  Future init() async
  {
    prefs = await SharedPreferences.getInstance();
    containController.text = prefs.getString("contain") ?? "";
  }

  @override
  void dispose()
  {
    containController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quick Laugh",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.orange,
        ),
          body: Container(
            height: double.infinity,
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/jokes.jpg'),
                fit: BoxFit.cover,
              )
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
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
                                labelStyle: TextStyle(color: Colors.amber),
                                border: OutlineInputBorder(),
                              ),
                              style: const TextStyle(color: Colors.amber),
                              value: selectedCategory,
                              items: categoryOptions, 
                              onChanged: (value) {
                                selectedCategory = value;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: DropdownButtonFormField(
                              decoration: const InputDecoration(
                                labelText: "Depth",
                                labelStyle: TextStyle(color: Colors.amber),
                                border: OutlineInputBorder(),
                              ),
                              style: const TextStyle(color: Colors.amber),
                              value: selectedDepth,
                              items: depthOptions, 
                              onChanged: (value) {
                                selectedDepth = value;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TextFormField(
                              controller: containController,
                              focusNode: containNode,
                              decoration: const InputDecoration(
                                labelText: "Contains",
                                labelStyle: TextStyle(color: Colors.amber),
                                border: OutlineInputBorder(),
                              ),
                              style: const TextStyle(color: Colors.amber),
                              onEditingComplete: () {
                                containNode.unfocus();
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                const Text(
                                  "Blacklist(Joke types you want to avoid):",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                CheckboxListTile(
                                  title: const Text(
                                    "NSFW",
                                    style: TextStyle(color: Colors.amber),
                                  ),
                                  controlAffinity: ListTileControlAffinity.leading,
                                  value: nsfwChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      nsfwChecked = value as bool;
                                    });
                                  },
                                  checkColor: Colors.red,
                                  activeColor: Colors.black,
                                ),
                                CheckboxListTile(
                                  title: const Text(
                                    "Religious",
                                    style: TextStyle(color: Colors.amber),
                                  ),
                                  controlAffinity: ListTileControlAffinity.leading,
                                  value: religiousChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      religiousChecked = value as bool;
                                    });
                                  },
                                  checkColor: Colors.red,
                                  activeColor: Colors.black,
                                ),
                                CheckboxListTile(
                                  title: const Text(
                                    "Political",
                                    style: TextStyle(color: Colors.amber),
                                  ),
                                  controlAffinity: ListTileControlAffinity.leading,
                                  value: politicalChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      politicalChecked = value as bool;
                                    });
                                  },
                                  checkColor: Colors.red,
                                  activeColor: Colors.black,
                                ),
                                CheckboxListTile(
                                  title: const Text(
                                    "Explicit",
                                    style: TextStyle(color: Colors.amber),
                                  ),
                                  controlAffinity: ListTileControlAffinity.leading,
                                  value: explicitChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      explicitChecked = value as bool;
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
                  ElevatedButton(
                    onPressed: () async {
                      await prefs.setString("contain", containController.text);
                      apiJokeUrl = "https://v2.jokeapi.dev/joke/$selectedCategory?type=$selectedDepth";
                      if(containController.text != null || containController.text.isNotEmpty)
                      {
                        apiJokeUrl = "https://v2.jokeapi.dev/joke/$selectedCategory?type=$selectedDepth&contains=${containController.text}";
                      }
                      if(nsfwChecked && religiousChecked && politicalChecked && explicitChecked)
                      {
                        apiJokeUrl = "https://v2.jokeapi.dev/joke/$selectedCategory?blacklistFlags=nsfw,religious,political,explicit&type=$selectedDepth&contains=${containController.text}";
                      }
                      if(nsfwChecked && religiousChecked && politicalChecked && !explicitChecked)
                      {
                        apiJokeUrl = "https://v2.jokeapi.dev/joke/$selectedCategory?blacklistFlags=nsfw,religious,political&type=$selectedDepth&contains=${containController.text}";
                      }
                      if(nsfwChecked && religiousChecked && !politicalChecked && !explicitChecked)
                      {
                        apiJokeUrl = "https://v2.jokeapi.dev/joke/$selectedCategory?blacklistFlags=nsfw,religious&type=$selectedDepth&contains=${containController.text}";
                      }
                      if(nsfwChecked && !religiousChecked && !politicalChecked && !explicitChecked)
                      {
                        apiJokeUrl = "https://v2.jokeapi.dev/joke/$selectedCategory?blacklistFlags=nsfw&type=$selectedDepth&contains=${containController.text}";
                      }
                      if(!nsfwChecked && religiousChecked && politicalChecked && explicitChecked)
                      {
                        apiJokeUrl = "https://v2.jokeapi.dev/joke/$selectedCategory?blacklistFlags=religious,political,explicit&type=$selectedDepth&contains=${containController.text}";
                      }
                      if(!nsfwChecked && religiousChecked && politicalChecked && !explicitChecked)
                      {
                        apiJokeUrl = "https://v2.jokeapi.dev/joke/$selectedCategory?blacklistFlags=religious,political&type=$selectedDepth&contains=${containController.text}";
                      }
                      if(!nsfwChecked && religiousChecked && !politicalChecked && !explicitChecked)
                      {
                        apiJokeUrl = "https://v2.jokeapi.dev/joke/$selectedCategory?blacklistFlags=religious&type=$selectedDepth&contains=${containController.text}";
                      }
                      if(!nsfwChecked && !religiousChecked && politicalChecked && explicitChecked)
                      {
                        apiJokeUrl = "https://v2.jokeapi.dev/joke/$selectedCategory?blacklistFlags=political,explicit&type=$selectedDepth&contains=${containController.text}";
                      }
                      if(!nsfwChecked && !religiousChecked && politicalChecked && !explicitChecked)
                      {
                        apiJokeUrl = "https://v2.jokeapi.dev/joke/$selectedCategory?blacklistFlags=political&type=$selectedDepth&contains=${containController.text}";
                      }
                      if(!nsfwChecked && !religiousChecked && !politicalChecked && explicitChecked)
                      {
                        apiJokeUrl = "https://v2.jokeapi.dev/joke/$selectedCategory?blacklistFlags=explicit&type=$selectedDepth&contains=${containController.text}";
                      }
                      jokes = await goGetJokes();
                      setState(() {
                        if(jokes["error"] == "true")
                        {
                          joke = jokes["message"];
                          print(jokes["message"]);
                        }
                        else if(selectedDepth == "Single" && jokes["error"] == "false")
                        {
                          joke = jokes["joke"];
                        }else if(selectedDepth == "TwoPart" && jokes["error"] == "false")
                        {
                          setup = jokes["setup"];
                          joke = jokes["delivery"];
                        }
                      });
                    }, 
                    child: const Text(
                      "Make me laugh!",
                      style: TextStyle(color: Colors.amber),
                    ),
                  ),
                  Text(
                    "$setup\n$joke",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.amber,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) {
                            return const AboutPage();
                          },
                        ),
                      );
                    }, 
                    child: const Text(
                      "Go to About Page",
                      style: TextStyle(color: Colors.amber),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About Page",
          style: TextStyle(color: Colors.orange),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              "Welcome to the About Page!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24
              ),
            ),
            const Text(
              "For my application, I decided to use a joke api and allow users to get jokes from different stipulations so they can have a quick laugh. Users can use a category dropwdown menu to choose the joke type like a programming, pun, or spooky joke. Then they can choose if the joke is a single line or a setup with a punchline. After users can add a letter or word that they want contained within the joke but the only disclaimer with that is the api may not have a joke with the word that users want contained which could return an error but I couldn't display the message. Finally users could blacklist joke types so they can have a more safe for work joke like NSFW jokes, religious jokes, or explicit jokes.\nImage Source: https://www.pinterest.com/pin/120541727512491767/",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              }, 
              child: const Text("Go Back!"),
            ),
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
