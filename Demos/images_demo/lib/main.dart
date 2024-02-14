import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(const MainApp());
}

String remoteImg = "https://media.contentapi.ea.com/content/dam/apex-legends/common/legends/apex-section-bg-legends-mirage-xl.jpg.adapt.1920w.jpg";

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "protest",
      ),
      home: DemoApp(),
    );
  }
}

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() =>  DemoAppState();
}

class  DemoAppState extends State<DemoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo App"),
      ),
      body: Center(
        child: Column(
          children: [
            // Image(
            //   width: 200,
            //   height: 200,
            //   image: AssetImage('assets/images/steve.jpg'),
            // ),
            GestureDetector(
              onTap: () {
                print("Image tapped");
              },
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/steve.jpg'),
                    fit: BoxFit.cover
                  ),
                  border: Border.all(
                    color: Colors.red,
                    width: 8,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                      offset: const Offset(5, 5)
                    ),
                  ],
                ),
              ),
            ),
            Image.network(
              remoteImg, 
              width: 200, 
              height: 200,
            ),
            Container(
              width: 400,
              height: 200,
              child: Text("This is a test of font usage",),
            ),
          ],
        )
      ),
    );
  }
}