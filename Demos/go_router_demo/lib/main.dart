import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainApp(),
    ),
    GoRoute(
      path: '/details/:title',
      builder: (context, state) => DetailsPage(
        title: state.pathParameters['title'],
      ),
    ),
    GoRoute(
      name: "aboutMe",
      path: '/about',
      builder: (context, state) 
      {
        final name = state.uri.queryParameters['name'];
        final age = state.uri.queryParameters['age'];
        return AboutPage(name: name, age: age,);
      }
    ),
  ],
);

void main() {
  runApp(const StartPage());
}

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

//Page 1
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page!"),
          backgroundColor: Colors.orange,
        ),
        body: Center(
          child: Column(
            children: [
              const Text('Welcome to the Home Page!'),
              ElevatedButton(
                onPressed: () {
                  context.go("/details/Lemhar");
                },
                child: const Text("Go Details!"),
              ),
              ElevatedButton(
                onPressed: () {
                  context.goNamed("aboutMe", queryParameters: 
                  {
                    "name": "Rahmen",
                    "age": "21",
                  });
                },
                child: const Text("Go About!"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Page 2
class DetailsPage extends StatefulWidget {
  final String? title;

  const DetailsPage(
    {
      super.key,
      required this.title,
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
        title: const Text("Details Page!"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Welcome to the Details Page!"),
            Text(widget.title ?? "Lemhar"),
            ElevatedButton(
              onPressed: () {
                context.go("/");
              }, 
              child: const Text("Go Back!"),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatefulWidget {
  final String? name;
  final String? age;

  const AboutPage(
    {
      super.key,
      this.name,
      this.age,
    }
  );

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Page!"),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Welcome to the About Page!'),
            Text("Name: ${widget.name}"),
            Text("Age: ${widget.age}"),
            ElevatedButton(
              onPressed: () {
                context.go("/");
              }, 
              child: const Text("Go Back!"),
            ),
          ],
        ),
      ),
    );
  }
}
