import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';

void main() {
  runApp(GameWidget(game: MultiMan()));
}

class MultiMan extends FlameGame with PanDetector
{
  late Player user;

  @override
  Color backgroundColor() => const Color(0x0087CEEB);

  @override
  Future<void> onLoad() async
  {
    await images.loadAll([
      "car.png",
      "spr_StrikerIdle_strip.png"
    ]);

    user = Player();
    add(user);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    user.move(info.delta.global);
  }
}

class Player extends SpriteAnimationComponent with HasGameRef<MultiMan>
{
  @override
  FutureOr<void> onLoad() async{
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache("spr_StrikerIdle_strip.png"), 
      SpriteAnimationData.sequenced(
        amount: 8, 
        stepTime: 0.12, 
        textureSize: Vector2.all(16)
      ),
    );
    anchor = Anchor.center;
    height = 100;
    width = 100;
    position = Vector2(game.size.x / 2, game.size.y - 100);
  }

  void move(Vector2 delta)
  {
    position.add(delta);
  }
}
