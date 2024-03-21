import 'package:flutter/material.dart';
import 'package:no_provider_demo/globals.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings Page"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey[200],
          child: Column(
            children: [
              Expanded(
                child: Text(
                  "Username: $username",
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Text(
                "$counter",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "New Username",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    username = usernameController.text;
                  });
                  FocusManager.instance.primaryFocus?.unfocus();
                  usernameController.clear();
                }, 
                child: const Text("Save"),
              ),
            ],
          ),
        ), 
      ),
    );
  }
}
