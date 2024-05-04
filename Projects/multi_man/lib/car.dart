import 'dart:async';
import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:multi_man/player.dart';
import 'main.dart';

class Car extends SpriteComponent with HasGameRef<MultiMan>, CollisionCallbacks
{
  //Load Car Image, angle it downward, give it a hit box
  @override
  Future<void> onLoad() async{
    sprite = Sprite(game.images.fromCache("car.png"));
    angle = pi;
    anchor = Anchor.center;
    height = 100;
    width = 100;
    add(CircleHitbox());
  }

//Check collision with player
  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if(other is Player)
    {
      removeFromParent();
    }
  }

//move cars downward and remove them when off screen
  @override
  void update(double dt) {
    super.update(dt);
    position.y += dt * 250;
    if(position.y > game.size.y)
    {
      removeFromParent();
    }
  }
  
  //Remove car when it hits player
  void doHit()
  {
    removeFromParent();
  }
}
