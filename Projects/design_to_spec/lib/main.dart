import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'dogico',
        scaffoldBackgroundColor: Color(0xFF35363D),
      ),
      home: DesignApp(),
    );
  }
}

class DesignApp extends StatefulWidget {
  const DesignApp({super.key});

  @override
  State<DesignApp> createState() => _DesignAppState();
}

class _DesignAppState extends State<DesignApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Trees & Wood",
          style: TextStyle(fontFamily: 'retro', color: Color(0xFFFFFFFF)),
        ),
        backgroundColor: Color(0xFF686868),
        leading: SvgPicture.asset('assets/images/pickaxe.svg',
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: context, 
                builder: (context)
                {
                  return AlertDialog(
                    alignment: Alignment.center,
                    title: Text("About"),
                    content: Column(
                      children: [
                        Text("Created by Rahmel Church Jr.",),
                        Text("Based on the work done in 235's Design to Spec Homework."),
                        Text("February 14th, 2024")
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        }, 
                        child: Text("Ok"),
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.center, 
                          backgroundColor: Color(0xFF686868),
                          foregroundColor: (Colors.black),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }, 
            icon: Icon(Icons.account_circle_rounded, color: Colors.black,),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/valley.jpg'))
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400,
                width: 420,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color(0xFFE8FDF5),
                      Color(0xFF244D3E),
                    ],
                    tileMode: TileMode.mirror,
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/oaktree.png'),
                    fit: BoxFit.contain,
                  ),
                  border: Border.all(
                    color: Color(0xFFFFFFFF),
                    width: 5,
                  )
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: Color(0xFF686868),
                    child: Text(
                      "THE OAK TREE",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'retro',
                      ),
                    ),
                  ),
                  Container(
                    color: Color(0xFF686868),
                    child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer porttitor, nisl vitae tincidunt pharetra, massa velit suscipit felis, id fermentum dolor libero nec ipsum. \nMorbi ullamcorper ligula eu ultricies pellentesque. Donec vestibulum efficitur augue nec sodales. Vivamus malesuada ante nec lacus congue, sit amet pulvinar nunc laoreet. Suspendisse finibus laoreet velit, et scelerisque lacus congue eu. Proin cursus hendrerit gravida. Aenean aliquam sed nibh in scelerisque. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer nec mollis felis.",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 18,
                      fontFamily: 'arial',
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 400.0)),
                ],
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Planks",
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 18,
        
                            ),
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Color(0xFF324E44),
                                Color(0xFF324E44),
                              ],
                            ),
                            image: DecorationImage(
                              image: AssetImage('assets/images/planks.png'),
                              alignment: Alignment.center,
                              fit: BoxFit.scaleDown,
                            ),
                            border: Border.all(
                              color: Color(0xFFFFFFFF),
                              width: 5,
                            )
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 311,
                          color: Color(0xFF686868),
                          child: SingleChildScrollView(
                            child: TextButton(
                              onPressed: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context, 
                                  builder: (context)
                                  {
                                    return AlertDialog(
                                      alignment: Alignment.center,
                                      backgroundColor: Color(0xFF686868),
                                      title: Text(
                                        "Planks",
                                        style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                      content: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 300,
                                            width: 300,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: <Color>[
                                                  Color(0xFF324E44),
                                                  Color(0xFF324E44),
                                                ],
                                              ),
                                              image: DecorationImage(
                                                image: AssetImage('assets/images/planks.png'),
                                              ),
                                              border: Border.all(
                                                color: Color(0xFFFFFFFF),
                                                width: 5,
                                              )
                                            ),
                                          ),
                                          Container(
                                            color: Color(0xFFFFFFFF),
                                            height: 250,
                                            child: SingleChildScrollView(
                                              child: Text("Planks are common blocks used as building blocks and in crafting recipies. They are one of the first things that a player can craftin Minecraft. Sed rutrum arcu dapibus, tristique mi eu, pulvinar erat. Nulla at nibh arcu. Cras id sem ac diam imperdiet aliquam. Duis pulvinar eget leo eu aliquam. Quisque aliquam semper dignissim. Etiam sed laoreet lacus. Duis ac ultrices elit. Nulla vestibulum nunc eu nulla cursus, in vestibulum ipsum dictum. Duis venenatis eleifend nisl, vel varius ligula imperdiet ac. Donec nec nisl bibendum, varius elit a, dapibus metus. Mauris libero ex, consectetur et lobortis eu, tincidunt nec nisl. Ut in sodales urna, et fringilla tellus. Sed purus lacus, consectetur ut lobortis eget, eleifend a nisi. Cras dignissim et orci vel elementum. Nullam vel feugiat massa. Ut condimentum molestie est vel viverra. Cras non metus eu leo vestibulum ullamcorper. Nunc rhoncus ullamcorper mollis. Proin faucibus sem nec nisl efficitur ultrices. Donec hendrerit dui sed porttitor pretium. Praesent sed lorem est. Duis sodales tellus a ante ultrices, et sollicitudin risus hendrerit. Nullam elit libero, dictum sed risus non, semper eleifend ipsum. Sed lectus ligula, finibus et faucibus id, vehicula et lacus. Sed sit amet nulla luctus, aliquam nisl ac, blandit augue. Phasellus nec lacus lectus. Proin eu gravida libero, id tincidunt nunc. Nunc quis porta nulla. Cras aliquet est neque, sed aliquet lorem mollis et. Duis malesuada ut velit ultrices porttitor. Donec sodales eu mi eu interdum. Aenean accumsan tempor lectus, cursus dictum nisl luctus ultricies. Maecenas eget libero sodales, dignissim nibh nec, mollis sem.",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }, 
                                          child: Text("Close"),
                                          style: ElevatedButton.styleFrom(
                                            alignment: Alignment.center, 
                                            backgroundColor: Color(0xFF686868),
                                            foregroundColor: (Colors.black),
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text("Planks are common blocks used as building blocks and in crafting recipies. They are one of the first things that a player can craftin Minecraft. Sed rutrum arcu dapibus, tristique mi eu, pulvinar erat. Nulla at nibh arcu. Cras id sem ac diam imperdiet aliquam. Duis pulvinar eget leo eu aliquam. Quisque aliquam semper dignissim. Etiam sed laoreet lacus. Duis ac ultrices elit.",
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 30.0)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Sticks",
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 18,
                            ),
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Color(0xFF324E44),
                                Color(0xFF324E44),
                              ],
                            ),
                            image: DecorationImage(
                              image: AssetImage('assets/images/stick.png'),
                              alignment: Alignment.center,
                              fit: BoxFit.scaleDown,
                            ),
                            border: Border.all(
                              color: Color(0xFFFFFFFF),
                              width: 5,
                            )
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 311,
                          color: Color(0xFF686868),
                          child: SingleChildScrollView(
                            child: TextButton(
                              onPressed: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context, 
                                  builder: (context)
                                  {
                                    return AlertDialog(
                                      alignment: Alignment.center,
                                      backgroundColor: Color(0xFF686868),
                                      title: Text(
                                        "Sticks",
                                        style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                      content: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 300,
                                            width: 300,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: <Color>[
                                                  Color(0xFF324E44),
                                                  Color(0xFF324E44),
                                                ],
                                              ),
                                              image: DecorationImage(
                                                image: AssetImage('assets/images/stick.png'),
                                              ),
                                              border: Border.all(
                                                color: Color(0xFFFFFFFF),
                                                width: 5,
                                              )
                                            ),
                                          ),
                                          Container(
                                            color: Color(0xFFFFFFFF),
                                            height: 250,
                                            child: SingleChildScrollView(
                                              child: Text("A stick is an item used for crafting many tools and items. Sed rutrum arcu dapibus, tristique mi eu, pulvinar erat. Nulla at nibh arcu. Cras id sem ac diam imperdiet aliquam. Duis pulvinar eget leo eu aliquam. Quisque aliquam semper dignissim. Etiam sed laoreet lacus. Duis ac ultrices elit. Nulla vestibulum nunc eu nulla cursus, in vestibulum ipsum dictum. Duis venenatis eleifend nisl, vel varius ligula imperdiet ac. Donec nec nisl bibendum, varius elit a, dapibus metus. Mauris libero ex, consectetur et lobortis eu, tincidunt nec nisl. Ut in sodales urna, et fringilla tellus. Sed purus lacus, consectetur ut lobortis eget, eleifend a nisi. Cras dignissim et orci vel elementum. Nullam vel feugiat massa. Ut condimentum molestie est vel viverra. Cras non metus eu leo vestibulum ullamcorper. Nunc rhoncus ullamcorper mollis. Proin faucibus sem nec nisl efficitur ultrices. Donec hendrerit dui sed porttitor pretium. Praesent sed lorem est. Duis sodales tellus a ante ultrices, et sollicitudin risus hendrerit. Nullam elit libero, dictum sed risus non, semper eleifend ipsum. Sed lectus ligula, finibus et faucibus id, vehicula et lacus. Sed sit amet nulla luctus, aliquam nisl ac, blandit augue. Phasellus nec lacus lectus. Proin eu gravida libero, id tincidunt nunc. Nunc quis porta nulla. Cras aliquet est neque, sed aliquet lorem mollis et. Duis malesuada ut velit ultrices porttitor. Donec sodales eu mi eu interdum. Aenean accumsan tempor lectus, cursus dictum nisl luctus ultricies. Maecenas eget libero sodales, dignissim nibh nec, mollis sem.",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }, 
                                          child: Text("Close"),
                                          style: ElevatedButton.styleFrom(
                                            alignment: Alignment.center, 
                                            backgroundColor: Color(0xFF686868),
                                            foregroundColor: (Colors.black),
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text("A stick is an item used for crafting many tools and items.",
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 30.0)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Chests",
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 18,
        
                            ),
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Color(0xFF324E44),
                                Color(0xFF324E44),
                              ],
                            ),
                            image: DecorationImage(
                              image: AssetImage('assets/images/chest.png'),
                              alignment: Alignment.center,
                              fit: BoxFit.scaleDown,
                            ),
                            border: Border.all(
                              color: Color(0xFFFFFFFF),
                              width: 5,
                            )
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 311,
                          color: Color(0xFF686868),
                          child: SingleChildScrollView(
                            child: TextButton(
                              onPressed: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context, 
                                  builder: (context)
                                  {
                                    return AlertDialog(
                                      alignment: Alignment.center,
                                      backgroundColor: Color(0xFF686868),
                                      title: Text(
                                        "Chests",
                                        style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                      content: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 300,
                                            width: 300,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: <Color>[
                                                  Color(0xFF324E44),
                                                  Color(0xFF324E44),
                                                ],
                                              ),
                                              image: DecorationImage(
                                                image: AssetImage('assets/images/chest.png'),
                                              ),
                                              border: Border.all(
                                                color: Color(0xFFFFFFFF),
                                                width: 5,
                                              )
                                            ),
                                          ),
                                          Container(
                                            color: Color(0xFFFFFFFF),
                                            height: 250,
                                            child: SingleChildScrollView(
                                              child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer porttitor, nisl vitae tincidunt pharetra, massa velit suscipit felis, id fermentum dolor libero nec ipsum. Sed rutrum arcu dapibus, tristique mi eu, pulvinar erat. Nulla at nibh arcu. Cras id sem ac diam imperdiet aliquam. Duis pulvinar eget leo eu aliquam. Quisque aliquam semper dignissim. Etiam sed laoreet lacus. Duis ac ultrices elit. Nulla vestibulum nunc eu nulla cursus, in vestibulum ipsum dictum. Duis venenatis eleifend nisl, vel varius ligula imperdiet ac. Donec nec nisl bibendum, varius elit a, dapibus metus. Mauris libero ex, consectetur et lobortis eu, tincidunt nec nisl. Ut in sodales urna, et fringilla tellus. Sed purus lacus, consectetur ut lobortis eget, eleifend a nisi. Cras dignissim et orci vel elementum. Nullam vel feugiat massa. Ut condimentum molestie est vel viverra. Cras non metus eu leo vestibulum ullamcorper. Nunc rhoncus ullamcorper mollis. Proin faucibus sem nec nisl efficitur ultrices. Donec hendrerit dui sed porttitor pretium. Praesent sed lorem est. Duis sodales tellus a ante ultrices, et sollicitudin risus hendrerit. Nullam elit libero, dictum sed risus non, semper eleifend ipsum. Sed lectus ligula, finibus et faucibus id, vehicula et lacus. Sed sit amet nulla luctus, aliquam nisl ac, blandit augue. Phasellus nec lacus lectus. Proin eu gravida libero, id tincidunt nunc. Nunc quis porta nulla. Cras aliquet est neque, sed aliquet lorem mollis et. Duis malesuada ut velit ultrices porttitor. Donec sodales eu mi eu interdum. Aenean accumsan tempor lectus, cursus dictum nisl luctus ultricies. Maecenas eget libero sodales, dignissim nibh nec, mollis sem.",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }, 
                                          child: Text("Close"),
                                          style: ElevatedButton.styleFrom(
                                            alignment: Alignment.center, 
                                            backgroundColor: Color(0xFF686868),
                                            foregroundColor: (Colors.black),
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer porttitor, nisl vitae tincidunt pharetra, massa velit suscipit felis, id fermentum dolor libero nec ipsum. Sed rutrum arcu dapibus, tristique mi eu, pulvinar erat. Nulla at nibh arcu. Cras id sem ac diam imperdiet aliquam. Duis pulvinar eget leo eu aliquam. Quisque aliquam semper dignissim. Etiam sed laoreet lacus. Duis ac ultrices elit.",
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 30.0)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Stairs",
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 18,
        
                            ),
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Color(0xFF324E44),
                                Color(0xFF324E44),
                              ],
                            ),
                            image: DecorationImage(
                              image: AssetImage('assets/images/stairs.png'),
                              alignment: Alignment.center,
                              fit: BoxFit.scaleDown,
                            ),
                            border: Border.all(
                              color: Color(0xFFFFFFFF),
                              width: 5,
                            )
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 311,
                          color: Color(0xFF686868),
                          child: SingleChildScrollView(
                            child: TextButton(
                              onPressed: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context, 
                                  builder: (context)
                                  {
                                    return AlertDialog(
                                      alignment: Alignment.center,
                                      backgroundColor: Color(0xFF686868),
                                      title: Text(
                                        "Stairs",
                                        style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                      content: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 300,
                                            width: 300,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: <Color>[
                                                  Color(0xFF324E44),
                                                  Color(0xFF324E44),
                                                ],
                                              ),
                                              image: DecorationImage(
                                                image: AssetImage('assets/images/stairs.png'),
                                              ),
                                              border: Border.all(
                                                color: Color(0xFFFFFFFF),
                                                width: 5,
                                              )
                                            ),
                                          ),
                                          Container(
                                            height: 250,
                                            color: Color(0xFFFFFFFF),
                                            child: SingleChildScrollView(
                                              child: Text("Sed rutrum arcu dapibus, tristique mi eu, pulvinar erat. Nulla at nibh arcu. Cras id sem ac diam imperdiet aliquam. Duis pulvinar eget leo eu aliquam. Quisque aliquam semper dignissim. Etiam sed laoreet lacus. Duis ac ultrices elit. Nulla vestibulum nunc eu nulla cursus, in vestibulum ipsum dictum. Duis venenatis eleifend nisl, vel varius ligula imperdiet ac. Donec nec nisl bibendum, varius elit a, dapibus metus. Mauris libero ex, consectetur et lobortis eu, tincidunt nec nisl. Ut in sodales urna, et fringilla tellus. Sed purus lacus, consectetur ut lobortis eget, eleifend a nisi. Cras dignissim et orci vel elementum. Nullam vel feugiat massa. Ut condimentum molestie est vel viverra. Cras non metus eu leo vestibulum ullamcorper. Nunc rhoncus ullamcorper mollis. Proin faucibus sem nec nisl efficitur ultrices. Donec hendrerit dui sed porttitor pretium. Praesent sed lorem est. Duis sodales tellus a ante ultrices, et sollicitudin risus hendrerit. Nullam elit libero, dictum sed risus non, semper eleifend ipsum. Sed lectus ligula, finibus et faucibus id, vehicula et lacus. Nunc quis porta nulla. Cras aliquet est neque, sed aliquet lorem mollis et. Duis malesuada ut velit ultrices porttitor. Donec sodales eu mi eu interdum. Aenean accumsan tempor lectus, cursus dictum nisl luctus ultricies. Maecenas eget libero sodales, dignissim nibh nec, mollis sem.",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }, 
                                          child: Text("Close"),
                                          style: ElevatedButton.styleFrom(
                                            alignment: Alignment.center, 
                                            backgroundColor: Color(0xFF686868),
                                            foregroundColor: (Colors.black),
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text("Sed rutrum arcu dapibus, tristique mi eu, pulvinar erat. Nulla at nibh arcu. Cras id sem ac diam imperdiet aliquam. Duis pulvinar eget leo eu aliquam. Quisque aliquam semper dignissim. Etiam sed laoreet lacus. Duis ac ultrices elit.",
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/trees.jpg'),
                    fit: BoxFit.fitHeight,
                  ),
                  border: Border(
                    top: BorderSide(color: Color(0xFFFFFFFF), width: 15),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "TREES ARE PRETTY COOL.",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 20,
                          fontFamily: 'retro',
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "RIGHT?",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 20,
                          fontFamily: 'retro',
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Copyright 2024",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 16,
                          fontFamily: 'retro',
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "RIT SCHOOL OF INTERACTIVE GAMES AND MEDIA",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 16,
                          fontFamily: 'retro',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}