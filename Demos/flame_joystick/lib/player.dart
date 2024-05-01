import 'dart:async';

import 'package:flame/components.dart';
import 'main.dart';

class Player extends SpriteComponent with HasGameRef<MainApp>
{
  final JoystickComponent joystick;

  Player(this.joystick);

  @override
  FutureOr<void> onLoad() async {
    sprite = Sprite(game.images.fromCache("car.png"));
    anchor = Anchor.center;
    height = 100;
    width = 100;
    position = Vector2(game.size.x / 2, game.size.y - 100);
  }

  @override
  void update(double dt) {
    if(!joystick.delta.isZero())
    {
      position.add(joystick.relativeDelta * dt * 200);
      angle = joystick.delta.screenAngle();
    }
  }
}