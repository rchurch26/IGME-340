import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:multi_man/clone.dart';
import 'player.dart';
import 'dart:async';
import 'multiman.dart';

void main() {
  runApp(GameWidget(game: MultiMan(),),);
}

class MultiMan extends FlameGame with TapCallbacks {
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
        return Car();
      }, 
      period: 1,
      area: 
    ));
  }

  @override
  void onTapUp(TapUpEvent event) {
    super.onTapUp(event);
    tapLoc = event.localPosition;
    user.moveToLoc(tapLoc);
  }
}
