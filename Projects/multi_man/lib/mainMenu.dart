import 'package:flutter/material.dart';
import 'package:multi_man/main.dart';

class MainMenuOverlay extends StatelessWidget {
  //Variables
  final MultiMan game;
  const MainMenuOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    //Center components
    return Center(
      //Place components in container that takes whole screen
      child: Container(
        height: double.infinity,
        width: double.infinity,
        //Place components in column
        child: Column(
          children: [
            //Title Text at Top
            const Text(
              "Multi-Motor",
              style: TextStyle(
                color: Colors.orangeAccent,
                fontSize: 48.0,
              ),
            ),
            //Center Instructions
            const Center(
              //Instruction text
              child: Text(
                "Tap an area to move the car there\nDouble Tap an area to create a clone and control it\nAvoid othe cars and survive\nHold to pause",
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 24.0,
                ),
              ),
            ),
            //Button to start game
            ElevatedButton(
              onPressed: () {
                game.overlays.remove("MainMenu");
                game.resumeEngine();
              }, 
              child: const Icon(Icons.play_arrow_sharp),
            ),
          ],
        ),
      ),
    );
  }
}
