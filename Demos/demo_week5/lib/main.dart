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
  var options = [
    DropdownMenuItem(
      value: "Option 1", 
      child: Text("Option 1"),
    ),
    DropdownMenuItem(
      value: "Option 2", 
      child: Text("Option 2"),
    ),
    DropdownMenuItem(
      value: "Option 3", 
      child: Text("Option 3"),
    ),
    DropdownMenuItem(
      value: "Option 4", 
      child: Text("Option 4"),
    ),
  ];

  var weaponList = ["Sword", "Axe", "Bow", "Dagger", "Spear"];

  String selectedWeapon = "Axe";
  String? selectedOption = "Option 1";
  String userData = "";

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    phoneController.addListener(() {
      print("Phone: ${phoneController.text}");
    });
    nameController.addListener(() {
      print("Name: ${nameController.text}");
    });
    phoneController.text = "3475552471";
    nameController.text = "Lemhar Rahmen";
  }

  @override
  void dispose() {
    phoneController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dropdown Button"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(userData),
            DropdownButton(
              value: selectedOption,
              items: options, 
              onChanged: (selected) {
                print(selected);
                setState(() {
                  selectedOption = selected;
                });
              },
            ),
            DropdownButton(
              value: selectedWeapon,
              items: weaponList.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(), 
              onChanged: (selected) {
                setState(() {
                  selectedWeapon = selected.toString();
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: phoneController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Enter your number",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.cyanAccent,
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      phoneController.clear();
                    },
                  ),
                ),
                onSubmitted: (value) {
                  print("You entered: ${phoneController.text}");
                  setState(() {
                    userData = phoneController.text;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: nameController,
                textInputAction: TextInputAction.previous,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Enter your name",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.deepOrangeAccent,
                  prefixIcon: Icon(Icons.account_box),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear_rounded),
                    onPressed: () {
                      nameController.clear();
                    },
                  ),
                ),
                onSubmitted: (value) {
                  print("You entered: $value");
                  setState(() {
                    userData = value;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print(selectedOption);
                print(selectedWeapon);
                print("Phone: ${phoneController.text}");
                print("Name: ${nameController.text}");
              }, 
              child: Text("What is selected?"),
            ),
          ],
        ),
      ),
    );
  }
}
