import 'dart:async';
import 'dart:math';
import 'package:flame/components.dart';
import 'package:multi_man/player.dart';

class Clone extends Player
{
  Vector2 newPos = Vector2.zero();

  @override
  Future<void> onLoad() async{
    sprite = Sprite(game.images.fromCache("clone.png"));
    anchor = Anchor.center;
    height = 100;
    width = 100;
    position = Vector2(game.size.x / 2, game.size.y - 800);
    newPos = Vector2(Random().nextDouble() * game.size.x, Random().nextDouble()*(game.size.y / 2));
  }

  @override
  void update(double dt) {
    super.update(dt);
    if(position.distanceTo(newPos) > 5)
    {
      position = position + (newPos - position).normalized() * 250 * dt;
    }
  }
}
