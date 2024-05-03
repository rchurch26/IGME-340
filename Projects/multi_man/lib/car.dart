import 'dart:async';
import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:multi_man/player.dart';
import 'main.dart';

class Car extends SpriteComponent with HasGameRef<MultiMan>, CollisionCallbacks
{
  @override
  Future<void> onLoad() async{
    sprite = Sprite(game.images.fromCache("car.png"));
    add(RectangleHitbox(anchor: Anchor.center, size: Vector2.all(10)));
    angle = pi;
    anchor = Anchor.center;
    height = 100;
    width = 100;
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if(other is Player)
    {
      removeFromParent();
    }
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
