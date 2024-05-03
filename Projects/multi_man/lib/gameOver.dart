import 'package:flutter/material.dart';
import 'package:multi_man/main.dart';

class GameOverOverlay extends StatelessWidget {
  final MultiMan game;
  int score;
  GameOverOverlay({super.key, required this.game, required this.score});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red,
        height: 200,
        width: 300,
        child: Center(
          child: Column(
            children: [
              const Text(
                "Game Over!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48.0,
                ),
              ),
              Text(
                "Score: $score",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 48.0,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  game.initializeGame();
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
