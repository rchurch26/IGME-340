import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Welcome to the Home Page!'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) 
                    {
                      return const DetailsPage(
                        name: "Rocket Man",
                        level: 20,
                      );
                    }
                  ),
                );
              },
              child: const Text("Go to Details!"),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pop(context);
            //   }, 
            //   child: const Text("DON'T DO!"),
            // ),
          ],
        ),
      ),
    );
  }
}

class DetailsPage extends StatefulWidget {
  final String name;
  final int level;

  const DetailsPage(
    {
      super.key,
      required this.name,
      required this.level,
    }
  );

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Page"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Welcome to the Details Page!"),
            Text("Name: ${widget.name}"),
            Text("Level: ${widget.level}"),
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
