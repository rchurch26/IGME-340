import 'dart:async';

import 'package:flame/components.dart';

import 'main.dart';

class Player extends SpriteComponent with HasGameRef<MainApp>
{
  double speed = 300;
  Vector2 newPos = Vector2.zero();

  @override
  Future<void> onLoad() async{
    sprite = Sprite(game.images.fromCache("car.png"));
    anchor = Anchor.center;
    height = 100;
    width = 100;
    position = Vector2(game.size.x / 2, game.size.y - 100);
    newPos = position;
  }

  @override
  void update(double dt) {
    super.update(dt);
    if(position.distanceTo(newPos) > 5)
    {
      position = position + (newPos - position).normalized() * speed * dt;
    }
  }

  void moveToLoc(Vector2 loc)
  {
    newPos = loc;
  }
}