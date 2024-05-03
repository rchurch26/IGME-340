import 'dart:async';
import 'package:flame/components.dart';
import 'main.dart';

class Car extends SpriteComponent with HasGameRef<MultiMan>
{

  @override
  Future<void> onLoad() async{
    sprite = Sprite(game.images.fromCache("multiman.png"));
    anchor = Anchor.center;
    height = 100;
    width = 100;
    position = Vector2(game.size.x / 2, game.size.y - 800);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += dt * 250;
    if(position.y > game.size.y)
    {
      removeFromParent();
    }
  }
}
