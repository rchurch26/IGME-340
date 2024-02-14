import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: DemoApp(),
    );
  }
}

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert Dialog"),
      ),
      body: Center(
        child: Column(
          children: [
            SvgPicture.asset('assets/images/bull.svg',
            width: 100,
            height: 100,
            colorFilter: ColorFilter.mode(
              Colors.black, 
              BlendMode.color,
              ),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  color: Colors.red,
                  width: 300,
                  height: 300,
                ),
                Container(
                  color: Colors.green,
                  width: 200,
                  height: 200,
                ),
                Positioned(
                  left: -50,
                  top: -50,
                  child: Container(
                    color: Colors.yellow,
                    width: 100,
                    height: 100,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                showMyAlert(context);
              }, 
              child: Text("Alert Me!"),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.pink,
                    duration: Duration(seconds: 10),
                    content: Column(
                      children: [
                        Icon(Icons.thumb_up),
                        Text("Here's a snack"),
                      ],
                    ),
                    action: SnackBarAction(
                      label: "Undo",
                      onPressed: () {
                        print("Undone");
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                    ),
                  ),
                );
              }, 
              child: Text("Give me a snack"),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                ..removeCurrentMaterialBanner()
                ..showMaterialBanner(
                  MaterialBanner(
                    backgroundColor: Colors.green,
                    leading: SvgPicture.asset("assets/images/bull.svg", width: 50, height: 50,),
                    content: Text("Bruce Banner!"), 
                    actions: [
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                        }, 
                        child: Text("Get Angry!"),
                      ),
                    ],
                  ),
                );
              }, 
              child: Text("Show me the banner"),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showMyAlert(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context)
              {
                return AlertDialog(
                  title: Text("Alerted!"),
                  content: Container(
                    color: Colors.red,
                    height: 300,
                    child: Center(child: Text("You have been alerted!")),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, 
                      child: Text("Ok")
                    ),
                    ElevatedButton(onPressed: () {
                      Navigator.pop(context);
                    }, 
                    child: Text("Cancel"),
                    )
                  ],
                );
              },);
  }
}
