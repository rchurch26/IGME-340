import 'package:flame/palette.dart';
import 'package:flame_joystick/player.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';

void main() {
  runApp(GameWidget(game: MainApp(),),);
}

class MainApp extends FlameGame {
  late final JoystickComponent joystick;
  late final Player user;
  
  @override
  Future<void> onLoad() async{
    await images.loadAll([
      "car.png",
    ]);

    final knob = BasicPalette.red.withAlpha(200).paint();
    final knobBg = BasicPalette.red.withAlpha(100).paint();

    //Create Joystick
    joystick = JoystickComponent(
      knob: CircleComponent(
        radius: 15,
        paint: knob,
      ),
      background: CircleComponent(
        radius: 50,
        paint: knobBg,
      ),
      margin: const EdgeInsets.only(left: 30, bottom: 30),
    );

    user = Player(joystick);
    add(user);
    add(joystick);
  }
}
