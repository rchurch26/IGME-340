import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';


Map<String, dynamic> posts = {};

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'dogico',
        scaffoldBackgroundColor: Colors.black,
      ),
      home: GifFinder(),
    );
  }
}

class GifFinder extends StatefulWidget {
  const GifFinder({super.key});

  @override
  State<GifFinder> createState() => _GifFinderState();
}

class _GifFinderState extends State<GifFinder> {
  final _myFormId = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();

  var resultOptions = [
    const DropdownMenuItem(
      value: 10,
      child: Text("10"),
    ),
    const DropdownMenuItem(
      value: 20,
      child: Text("20"),
    ),
    const DropdownMenuItem(
      value: 30,
      child: Text("30"),
    ),
    const DropdownMenuItem(
      value: 40,
      child: Text("40"),
    ),
    const DropdownMenuItem(
      value: 50,
      child: Text("50"),
    ),
  ];
  var ratingOptions = [
    const DropdownMenuItem(
      value: "g",
      child: Text("g"),
    ),
    const DropdownMenuItem(
      value: "pg",
      child: Text("pg"),
    ),
    const DropdownMenuItem(
      value: "pg-13",
      child: Text("pg-13"),
    ),
    const DropdownMenuItem(
      value: "r",
      child: Text("r"),
    ),
  ];

  int? selectedResult = 10;
  String? selectedRating = "g";


  late FocusNode searchNode;

  @override
  void initState()
  {
    super.initState();
    searchNode = FocusNode();
    searchController.addListener(() {
      print("Search: ${searchController.text}");
    });
    grabTrending();
  }

  @override
  void dispose()
  {
    searchController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    String url = "https://giphy.com";

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          leading: Icon(Icons.gif_box_sharp, size: 50,),
          title: Text("Gif Finder"),
        ),
        body: Container(
          height: double.infinity,
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Form(
                    key: _myFormId,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 15.0),
                          child: TextFormField(
                            controller: searchController,
                            focusNode: searchNode,
                            style: TextStyle(color: Colors.white),
                            onEditingComplete: () {
                              searchNode.unfocus();
                            },
                            decoration: InputDecoration(
                              labelText: "Search Term",
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.white,),
                            ),
                            validator: (value) {
                              if(value == null || value.isEmpty)
                              {
                                return "Please enter some text";
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15.0,),
                          child: DropdownButtonFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: "Number of Results",
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.white,),
                            ),
                            value: selectedResult,
                            items: resultOptions, 
                            onChanged: (selected)
                            {
                              setState(() {
                                selectedResult = selected;
                              });
                            },
                          ),
                        ),
                        DropdownButtonFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "Rating",
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Colors.white,),
                          ),
                          value: selectedRating,
                          items: ratingOptions, 
                          onChanged: (selected)
                          {
                            setState(() {
                              selectedRating = selected;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3.0),),
                        ),
                      ),
                      onPressed: () {
                        searchController.clear();
                        setState(() {
                          selectedResult = 10;
                          selectedRating = "g";
                        });
                      }, 
                      child: Text("Reset"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3.0),),
                        ),
                      ),
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        posts = await goGetPosts(searchController.text, selectedResult, selectedRating);
                      }, 
                      child: Text("Find Gifs!"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3.0),),
                        ),
                      ),
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if(!await launchUrl(Uri.parse("$url/search/${searchController.text}")))
                        {
                          throw "Couldn't launch $url";
                        }
                      }, 
                      child: Text("Use Giphy!"),
                    ),
                  ],
                ),
                Text("Result Count: $selectedResult", style: TextStyle(color: Colors.white),),
                Container(
                  height: 400,
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: selectedResult,
                    itemBuilder: (context, index) {
                      if(posts.isEmpty)
                      {
                        return null;
                      }
                      return GridTile(
                        child: InkWell(
                          onTap: () {
                            print("Tapped!");
                            AlertDialog alert = AlertDialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
                              title: Text(posts["data"][index]["title"]),
                              content: Container(
                                height: double.infinity,
                                child: Image.network(
                                  posts["data"][index]["images"]["original"]["url"],
                                ),
                              ),
                              actions: [

                              ],
                            );
                            showDialog(context: context, builder: (BuildContext context) 
                            {
                              return alert;
                            });
                          },
                          child: Image.network(
                            posts["data"][index]["images"]["fixed_height"]["url"],
                            width: 200,
                            height: 200,
                          ),
                        ),
                      );
                    },
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

Future<dynamic> goGetPosts(String userSearch, int? resultNum, String? rating) async
{
  String apiPostUrl = "https://api.giphy.com/v1/gifs/search?api_key=aKj4vQZcn3ME5T0ND8ks5ANbTsb8z5v0&q=$userSearch&limit=$resultNum&offset=0&rating=$rating&lang=en&bundle=messaging_non_clips";
  var data = {};
  var response = await http.get(Uri.parse(apiPostUrl));
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

Future<dynamic> goGetTrending() async
{
  String apiPostUrl = "https://api.giphy.com/v1/gifs/trending?api_key=aKj4vQZcn3ME5T0ND8ks5ANbTsb8z5v0&limit=10&offset=0&rating=g&bundle=messaging_non_clips";
  var data = {};
  var response = await http.get(Uri.parse(apiPostUrl));
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

Future grabTrending() async
{
  posts = await goGetTrending();
}
