import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:multi_man/car.dart';
import 'package:multi_man/clone.dart';
import 'main.dart';

class Player extends SpriteComponent with HasGameRef<MultiMan>, CollisionCallbacks
{
  //Variables
  double speed = 250;
  Vector2 newPos = Vector2.zero();
  int score = 0;

//Load player sprite and give it a hitbox
  @override
  Future<void> onLoad() async{
    sprite = Sprite(game.images.fromCache("car.png"));
    anchor = Anchor.center;
    height = 100;
    width = 100;
    position = Vector2(game.size.x / 2, game.size.y - 100);
    newPos = position;
    add(CircleHitbox());
  }

//Collision Check
  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    //Remove player and show game over overlay
    if(other is Car)
    {
      other.doHit();
      removeFromParent();
      game.pauseEngine();
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
    //Increment score
    score = score + 5;
  }

//Move Player to tap location
  void moveToLoc(Vector2 loc)
  {
    newPos = loc;
  }

//Clone Player to Location
  void clone(Vector2 loc)
  {
    Clone clone = Clone(clonePos: loc);
    add(clone);
    game.user = clone;
  }
}
