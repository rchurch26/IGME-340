import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/counter_provider.dart';
import '../providers/username_provider.dart';

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
                  "Username: ${context.watch<UsernameProvider>().username}",
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Text(
                "${context.watch<CounterProvider>().counter}",
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
                  context.read<UsernameProvider>().changeUsername(usernameController.text);
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
