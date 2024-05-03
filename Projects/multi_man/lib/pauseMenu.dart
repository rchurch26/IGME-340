import 'package:flutter/material.dart';
import 'package:multi_man/main.dart';

class PauseMenuOverlay extends StatelessWidget {
  final MultiMan game;
  const PauseMenuOverlay({super.key, required this.game});

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
              "PAUSED!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 48.0,
              ),
            ),
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
