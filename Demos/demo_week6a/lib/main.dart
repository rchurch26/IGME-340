import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

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
  final _myFormId = GlobalKey<FormState>();
  bool? cb01 = false;
  bool? cb02 = false;
  List<Map> inventory = [
    {"name" : "Sword", "price" : 100},
    {"name" : "Spear", "price" : 75},
    {"name" : "Dagger", "price" : 0},
    {"name" : "Axe", "price" : 90},
    {"name" : "Crossbow", "price" : 200},
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo App"),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          child: Form(
            key: _myFormId,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Enter name",
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty)
                    {
                      return "Please enter some text";
                    }else if(value.length <= 1)
                    {
                      return "Name should be greater than 1 character";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Enter email",
                  ),
                  validator: (value) {
                    if(value != null && !EmailValidator.validate(value))
                    {
                      return "Please enter valid email";
                    }
                    return null;
                  },
                ),
                Checkbox(
                  activeColor: Colors.red,
                  tristate: true,
                  value: cb01, 
                  onChanged: (value){
                    setState(() {
                      cb01 = value;
                      print(cb01);
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  checkColor: Colors.red,
                  secondary: Icon(Icons.access_alarm),
                  activeColor: Colors.black,
                  title: const Text("I like dogs:"),
                  value: cb02, 
                  onChanged: (value) {
                    setState(() {
                      cb02 = value;
                    });
                  }
                ),
                ElevatedButton(
                  onPressed: () {
                    if(_myFormId.currentState!.validate())
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Processing..."),
                        ),
                      );
                    }
                  }, 
                  child: const Text("Submit"),
                ),
                Container(
                  color: Colors.grey,
                  width: double.infinity,
                  height: 100,
                  child: ListView(
                    padding: const EdgeInsets.all(10),
                    reverse: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        width: 150,
                        color: Colors.teal,
                        child: Text("Sword"),
                      ),
                      Container(
                        width: 150,
                        color: Colors.teal,
                        child: Text("Dagger"),
                      ),
                      Container(
                        width: 150,
                        color: Colors.teal,
                        child: Text("Spear"),
                      ),
                      Container(
                        width: 150,
                        color: Colors.teal,
                        child: Text("Axe"),
                      ),
                    ],
                  ),
                ),
                Container(
                  //ListViewBuilder
                  width: double.infinity,
                  height: 299,
                  color: Colors.cyanAccent,
                  child: ListView.builder(
                    itemCount: inventory.length,
                    itemBuilder: (context, index)
                    {
                      return Container(
                        height: 50,
                        color: Colors.orange,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(child: Text("${inventory[index]["name"]}")),
                              Expanded(child: Text("${inventory[index]["price"]}")),
                            ],
                          ),
                        ),
                      );
                    }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
