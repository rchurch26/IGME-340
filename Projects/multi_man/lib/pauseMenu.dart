import 'package:flutter/material.dart';
import 'package:multi_man/main.dart';

class PauseMenuOverlay extends StatelessWidget {
  //Variables
  final MultiMan game;
  const PauseMenuOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    //Place everything in center
    return Center(
      //Place components in black 200 high and 300 wide container
      child: Container(
        color: Colors.black,
        height: 200,
        width: 300,
        //Center components
        child: Center(
          //Place components in a column
          child: Column(
            children: [
              //Create orange text with size of 48px
              const Text(
                "PAUSED!",
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 48.0,
                ),
              ),
              //Button that resumes play
              ElevatedButton(
                onPressed: () {
                  game.overlays.remove("PauseMenu");
                  game.paused = false;
                }, 
                child: const Icon(Icons.play_arrow_sharp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
