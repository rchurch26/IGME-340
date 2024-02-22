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
      home: LabApp(),
    );
  }
}

class LabApp extends StatefulWidget {
  const LabApp({super.key});

  @override
  State<LabApp> createState() => _LabAppState();
}

class _LabAppState extends State<LabApp> {
  final _myFormId = GlobalKey<FormState>();
  var options = [
    const DropdownMenuItem(
      value: "Email",
      child: Text("Email"),
    ),
    const DropdownMenuItem(
      value: "Text",
      child: Text("Text"),
    ),
    const DropdownMenuItem(
      value: "Call",
      child: Text("Call"),
    ),
  ];
  String? selectedOption = "Email";
  String userData = "Your data will show here!";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState()
  {
    super.initState();
    nameController.addListener(() {
      print("Name: ${nameController.text}");
    });
    emailController.addListener(() {
      print("Email: ${emailController.text}");
    });
    dobController.addListener(() {
      print("Date of Birth: ${dobController.text}");
    });
    phoneController.addListener(() {
      print("Phone: ${phoneController.text}");
    });
  }

  @override
  void dispose()
  {
    nameController.dispose();
    emailController.dispose();
    dobController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Orbital Trajectory Beta Signup Form"),
      ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: 50,
              child: const Text(
                'Welcome to Rocket Class!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: 375,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: SingleChildScrollView(
                child: Text(
                  userData,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            const Text(
              "Enter your information for a chance to get invited!",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _myFormId,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                        // suffixIcon: IconButton(
                        //   icon: Icon(Icons.clear),
                        //   onPressed: () {
                        //     nameController.clear();
                        //   },
                        // ),
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
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email_sharp),
                        // suffixIcon: IconButton(
                        //   icon: Icon(Icons.clear),
                        //   onPressed: () {
                        //     nameController.clear();
                        //   },
                        // ),
                      ),
                      validator: (value) {
                        if(value != null && !EmailValidator.validate(value))
                        {
                          return "Please enter valid email";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: dobController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                        labelText: "Date of Birth",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.calendar_month_rounded),
                        // suffixIcon: IconButton(
                        //   icon: Icon(Icons.clear),
                        //   onPressed: () {
                        //     nameController.clear();
                        //   },
                        // ),
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty)
                        {
                          return "Please enter your date of birth";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: phoneController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: "Phone",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone_callback_outlined),
                        // suffixIcon: IconButton(
                        //   icon: Icon(Icons.clear),
                        //   onPressed: () {
                        //     nameController.clear();
                        //   },
                        // ),
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty)
                        {
                          return "Please enter your number";
                        }else if(value.length < 10)
                        {
                          return "Enter valid number";
                        }
                        return null;
                      },
                    ),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.question_mark),
                      ),
                      value: selectedOption,
                      items: options, 
                      onChanged: (selected)
                      {
                        print(selected);
                        setState(() {
                          selectedOption = selected;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
                  ),
                  onPressed: () {
                    nameController.clear();
                    emailController.clear();
                    dobController.clear();
                    phoneController.clear();
                    setState(() {
                      selectedOption = "Email";
                      userData = "Your data will show here!";
                    });
                  },
                  child: const Text(
                    "Reset Form",
                    style: TextStyle(
                      color: Colors.white,
                      
                    ),
                  ),
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
                  ),
                  onPressed: () {
                    setState(() {
                      userData = "Name: ${nameController.text}\nEmail: ${emailController.text}\nDate of Birth: ${dobController.text}\nPhone Number: ${phoneController.text}\nPreferred Contact: $selectedOption";
                    });
                  },
                  child: const Text(
                    "Submit Form",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}
