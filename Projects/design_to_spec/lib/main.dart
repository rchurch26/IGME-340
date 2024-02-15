import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      ),
      home: DesignApp(),
    );
  }
}

class DesignApp extends StatefulWidget {
  const DesignApp({super.key});

  @override
  State<DesignApp> createState() => _DesignAppState();
}

class _DesignAppState extends State<DesignApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Trees & Wood",
          style: TextStyle(fontFamily: 'retro', color: Color(0xFFFFFFFF)),
        ),
        backgroundColor: Color(0xFF686868),
        leading: SvgPicture.asset('assets/images/pickaxe.svg',
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: context, 
                builder: (context)
                {
                  return AlertDialog(
                    alignment: Alignment.center,
                    title: Text("About"),
                    content: Column(
                      children: [
                        Text("Created by Rahmel Church Jr.",),
                        Text("Based on the work done in 235's Design to Spec Homework."),
                        Text("February 14th, 2024")
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        }, 
                        child: Text("Ok"),
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.center, 
                          backgroundColor: Color(0xFF686868),
                          foregroundColor: (Colors.black),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }, 
            icon: Icon(Icons.account_circle_rounded, color: Colors.black,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xFFE8FDF5),
                    Color(0xFF244D3E),
                  ],
                  tileMode: TileMode.mirror,
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/oaktree.png'),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}