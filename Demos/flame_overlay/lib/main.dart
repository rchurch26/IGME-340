import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'doubleTapOverlay.dart';

void main() {
  runApp(
    GameWidget(
      game: MainApp(),
      overlayBuilderMap: {
        "PauseMenu": (_, game){
          return pauseMenu();
        },
        "DoubleTapOverlay": (_, game){
          return DoubleTapOverlay(
            game: game as MainApp,
          );
        },
      },
    ),
  );
}

Widget pauseMenu()
{
  return Center(
    child: Container(
      color: Colors.red,
      height: 200,
      width: 300,
      child: const Center(
        child: Text(
          "PAUSED!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 48.0,
          ),
        ),
      ),
    ),
  );
}

class MainApp extends FlameGame with TapDetector, DoubleTapDetector{
  @override
  Color backgroundColor() => Colors.greenAccent;

  @override
  void onTap()
  {
    if(overlays.isActive("PauseMenu"))
    {
      print("Resume");
      overlays.remove("PauseMenu");
      resumeEngine();
    }
    else
    {
      print("Pause");
      pauseEngine();
      overlays.add("PauseMenu");
    }
  }

  @override
  void onDoubleTap()
  {
    if(overlays.isActive("DoubleTapOverlay"))
    {
      print("Remove DoubleTapOverlay");
      overlays.remove("DoubleTapOverlay");
      resumeEngine();
    }
    else
    {
      print("Add DoubleTapOcverlay");
      overlays.add("DoubleTapOverlay");
      pauseEngine();
    }
  }
}
