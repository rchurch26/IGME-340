import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        fontFamily: "courier",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.grey[300],
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Colors.orange,
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: TextStyle(
            color: Colors.orange,
            fontSize: 36,
            fontWeight: FontWeight.w600,
          ),
          displaySmall: TextStyle(
            color: Colors.orange,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
          bodyLarge: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w200,
          ),
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
          bodySmall: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w100,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Theme.of(context).colorScheme.primary),
            foregroundColor: MaterialStatePropertyAll<Color>(Theme.of(context).colorScheme.error),
            textStyle: MaterialStatePropertyAll<TextStyle?>(Theme.of(context).textTheme.bodyMedium),
          )
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        scaffoldBackgroundColor: Colors.blueGrey[500],
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Colors.green[200],
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: TextStyle(
            color: Colors.green[200],
            fontSize: 36,
            fontWeight: FontWeight.w600,
          ),
          displaySmall: TextStyle(
            color: Colors.green[200],
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w200,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
          bodySmall: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w100,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IGME-340: Themes"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {print("Icon Pressed");}, 
              child: Icon(
                Icons.backpack_sharp,
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 5,
                    color: Colors.amber
                  )
                )
              )
            ),
            TextButton(
              onPressed: () {print("Text Pressed");}, 
              child: Text("Word Button"),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),
                foregroundColor: MaterialStatePropertyAll<Color>(Colors.cyan),
                textStyle: MaterialStatePropertyAll<TextStyle>(TextStyle(fontSize: 18)),
              ),
            ),
            OutlinedButton(
              onPressed: () {print("Outline Pressed");}, 
              child: Text("Outline Button"),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.orange),
                foregroundColor: MaterialStatePropertyAll<Color>(Colors.cyan),
                textStyle: MaterialStatePropertyAll<TextStyle>(TextStyle(fontSize: 24)),
              ),
            ),
            Container(
              width: 300,
              height: 200,
              color: Theme.of(context).colorScheme.primary,
              child: Text(
                "I am Green",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Container(
              width: 200,
              height: 200,
              color: Theme.of(context).colorScheme.secondary,
              child: Text(
                "I am Yellow",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Container(
              width: 350,
              height: 100,
              color: Theme.of(context).colorScheme.error,
              child: Text(
                "I am Pink",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print("Elevated 1 Pressed");
              },
              child: const Text('Elevated Button'),
            ),
            ElevatedButton(
              onPressed: () {
                print("Elevated 2 Pressed");
              },
              child: const Text('Elevated Button 2'),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.black),
                foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
