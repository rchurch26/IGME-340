import 'package:flutter/material.dart';
import 'main.dart';

class DoubleTapOverlay extends StatelessWidget {
  final MainApp game;
  const DoubleTapOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 500,
              width: 500,
              color: Colors.purple,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Item $index"),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: (){
                game.overlays.remove("DoubleTapOverlay");
              }, 
              child: const Text("Close"),
            ),
          ],
        ),
      ),
    );
  }
}