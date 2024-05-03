import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:multi_man/car.dart';
import 'main.dart';

class Player extends SpriteComponent with HasGameRef<MultiMan>, CollisionCallbacks
{
  double speed = 250;
  Vector2 newPos = Vector2.zero();

  @override
  Future<void> onLoad() async{
    sprite = Sprite(game.images.fromCache("car.png"));
    add(RectangleHitbox(size: Vector2.all(3), anchor: Anchor.center));
    anchor = Anchor.center;
    height = 100;
    width = 100;
    position = Vector2(game.size.x / 2, game.size.y - 100);
    newPos = position;
  }

//Collision Check
  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    //Remove player and show game over overlay
    if(other is Car)
    {
      removeFromParent();
      game.overlays.add("GameOver");
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    //Check if new position has a distance over 5 from the current position
    if(position.distanceTo(newPos) > 5)
    {
      //Set position to new position
      position = position + (newPos - position).normalized() * speed * dt;
    }
  }

//Move Player to tap location
  void moveToLoc(Vector2 loc)
  {
    newPos = loc;
  }
}
