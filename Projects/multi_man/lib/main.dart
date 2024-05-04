//import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/experimental.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
//import 'package:multi_man/clone.dart';
import 'package:multi_man/mainMenu.dart';
import 'pauseMenu.dart';
import 'gameOver.dart';
import 'player.dart';
import 'dart:async';
import 'car.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    GameWidget(
      //Game call
      game: MultiMan(),
      //Overlay map
      overlayBuilderMap: {
        //Main menu overlay
        "MainMenu": (_, game)
        {
          return MainMenuOverlay(game: game as MultiMan);
        },
        //Pause overlay
        "PauseMenu": (_, game)
        {
          return PauseMenuOverlay(game: game as MultiMan);
        },
        //Game over overlay
        "GameOver": (_, game,)
        {
          return GameOverOverlay(
            game: game as MultiMan,
          );
        }
      },
      //Make main menu shown first
      initialActiveOverlays: const ["MainMenu"],
    ),
  );
}

class MultiMan extends FlameGame with TapCallbacks, HasCollisionDetection, DoubleTapCallbacks{
  //Variables
  late Player user;
  late Vector2 tapLoc;
  late Vector2 cloneLoc;
  late TextComponent scoreText;

  // @override
  // bool debugMode = true;

  //remove splash image
  void removeSplash() async{
    await Future.delayed(const Duration(seconds: 5));
    FlutterNativeSplash.remove();
  }

//load assets and remove spalsh image
  @override
  Future<void> onLoad() async{
    removeSplash();
    //load car
    await images.loadAll(["car.png"]);
    //create endless road with repeating image
    final parallax = await loadParallaxComponent(
      [
        ParallaxImageData("road.png"),
      ],
      size: Vector2(size.x, size.y),
      baseVelocity: Vector2(0, -50),
      repeat: ImageRepeat.repeat,
      velocityMultiplierDelta: Vector2(0, 5),
    );
    //add road
    add(parallax);
    //begin game
    initializeGame();
    //stop engine before playing
    pauseEngine();
    //display score
    scoreText = TextComponent(
      text: user.score.toString(),
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
      anchor: Anchor.center,
      position: Vector2((size.x / 2) + 50, size.y - 800),
    );
    add(scoreText);
  }

//add assets
  void initializeGame()
  {
    //initilaize and add player
    user = Player();
    add(user);
    //spawn cars
    add(SpawnComponent(
      factory: (index)
      {
        return Car()..add(
          ColorEffect(Colors.orange, EffectController(duration: 0),),
        );
      }, 
      period: 2,
      area: Rectangle.fromLTWH(0, 0, size.x, -800),
    ));
  }

//update score
  @override
  void update(double dt) {
    super.update(dt);
    scoreText.text = user.score.toString();
  }

//move player to tap location
  @override
  void onTapUp(TapUpEvent event) {
    super.onTapUp(event);
    tapLoc = event.localPosition;
    user.moveToLoc(tapLoc);
  }

//pause when player holds down
  @override
  void onLongTapDown(TapDownEvent event) {
    super.onLongTapDown(event);
    paused = true;
    overlays.add("PauseMenu");
  }

  // @override
  // void onDoubleTapDown(DoubleTapDownEvent event) {
  //   super.onDoubleTapDown(event);
  //   cloneLoc = event.localPosition;
  //   user.clone(cloneLoc);
  // }
}
