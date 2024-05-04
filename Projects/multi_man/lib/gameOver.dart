import 'package:flutter/material.dart';
import 'package:multi_man/main.dart';

class GameOverOverlay extends StatelessWidget {
  //Variables
  final MultiMan game;
  const GameOverOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    //Center Components
    return Center(
      //Place components in a black 200 high 300 wide container
      child: Container(
        color: Colors.black,
        height: 200,
        width: 300,
        //Center components
        child: Center(
          //Place components in column
          child: Column(
            children: [
              //Big Game over text
              const Text(
                "Game Over!",
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 48.0,
                ),
              ),
              //Score text
              Text(
                "Score: ${game.user.score}",
                style: const TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 48.0,
                ),
              ),
              //Button to play again
              ElevatedButton(
                onPressed: () {
                  game.initializeGame();
                  game.resumeEngine();
                  game.overlays.remove("GameOver");
                }, 
                child: const Icon(Icons.restart_alt_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
