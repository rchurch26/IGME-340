import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/experimental.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:multi_man/clone.dart';
import 'player.dart';
import 'dart:async';
import 'car.dart';

void main() {
  runApp(GameWidget(game: MultiMan(),),);
}

class MultiMan extends FlameGame with TapCallbacks, HasCollisionDetection {
  late Player user;
  late Vector2 tapLoc;

  @override
  Future<void> onLoad() async{
    await images.loadAll(["car.png"]);
    final parallax = await loadParallaxComponent(
      [
        ParallaxImageData("road.png"),
      ],
      size: Vector2(size.x, size.y),
      baseVelocity: Vector2(0, -50),
      repeat: ImageRepeat.repeat,
      velocityMultiplierDelta: Vector2(0, 5),
    );
    add(parallax);
    user = Player();
    add(user);
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

  @override
  void onTapUp(TapUpEvent event) {
    super.onTapUp(event);
    tapLoc = event.localPosition;
    user.moveToLoc(tapLoc);
  }
}
