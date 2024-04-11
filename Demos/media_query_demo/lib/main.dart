import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    double currentHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: currentWidth < 700? Colors.red : Colors.blue,
        // body: const Center(
        //   child: Text('Hello World!'),
        // ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxWidth < 700)
          {
            return const PortraitMode();
          }
          else
          {
            return const LandscapeMode();
          }
        },
      ),
    );
  }
}

//Portrait Mode
class PortraitMode extends StatefulWidget {
  const PortraitMode({super.key});

  @override
  State<PortraitMode> createState() => _PortraitModeState();
}

class _PortraitModeState extends State<PortraitMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Portrait Mode"),
        backgroundColor: Colors.orange[300],
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Portrait Mode"),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      color: Colors.pink,
                      height: 150,
                      child: Text("Item $index"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Landscape Mode
class LandscapeMode extends StatefulWidget {
  const LandscapeMode({super.key});

  @override
  State<LandscapeMode> createState() => _LandscapeModeState();
}

class _LandscapeModeState extends State<LandscapeMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Landscape Mode"),
        backgroundColor: Colors.tealAccent[300],
      ),
      body: Center(
        child: Row(
          children: [
            const Text("Landscape Mode"),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      color: Colors.pink,
                      width: 150,
                      child: Text("Item $index"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
