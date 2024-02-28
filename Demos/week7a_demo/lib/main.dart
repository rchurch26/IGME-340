import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  late FocusNode nameNode;
  late FocusNode emailNode;
  late FocusNode phoneNode;

  @override
  void initState() {
    super.initState();
    nameNode = FocusNode();
    emailNode = FocusNode();
    phoneNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Week 7A Demo"),
          ),
          body: Container(
            height: double.infinity,
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //GridView.builder
                  Container(
                    height: 300,
                    color: Color.fromARGB(255, 186, 186, 248),
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return GridTile(
                          header: Text("Header ${index+1}"),
                          footer: Text("Footer ${index+1}"),
                          child: Container(
                            color: Colors.amberAccent,
                            child: Center(
                              child: Text("Grid ${index+1}"),
                            ),
                          ),
                        );
                        // return Container(
                        //   color: Colors.green,
                        //   width: 50,
                        //   height: 50,
                        //   child: Center(child: Text("Grid ${index+1}")),
                        // );
                      },
                    ),
                  ),

                  //GridView.count
                  Container(
                    height: 300,
                    color: Color.fromARGB(255, 220, 200, 200),
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: [
                        Container(
                          color: Colors.pink,
                          child: Center(
                            child: Text("Grid 1"),
                          ),
                        ),
                        Container(
                          color: Colors.blue,
                          child: Center(
                            child: Text("Grid 2"),
                          ),
                        ),
                        Container(
                          color: Colors.green,
                          child: Center(
                            child: Text("Grid 3"),
                          ),
                        ),
                        Container(
                          color: Colors.purple,
                          child: Center(
                            child: Text("Grid 4"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextField(
                    controller: nameController,
                    focusNode: nameNode,
                    onEditingComplete: () {
                      emailNode.requestFocus();
                    },
                    // onTapOutside: (event) {
                    //   FocusManager.instance.primaryFocus?.unfocus();
                    // },
                    decoration: InputDecoration(
                      labelText: "Name",
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  TextField(
                    controller: emailController,
                    focusNode: emailNode,
                    onEditingComplete: () {
                      phoneNode.requestFocus();
                    },
                    decoration: InputDecoration(
                      labelText: "Email",
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  TextField(
                    controller: phoneController,
                    focusNode: phoneNode,
                    onEditingComplete: () {
                      phoneNode.unfocus();
                    },
                    decoration: InputDecoration(
                      labelText: "Phone",
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Text("Submit"),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
