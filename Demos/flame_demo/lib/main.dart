import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';

void main() {
  runApp(GameWidget(game: MainApp()));
}

class MainApp extends FlameGame with PanDetector
{
  late Player user;

  @override
  Future<void> onLoad() async
  {
    await images.loadAll([
      "car.png"
    ]);

    user = Player();
    add(user);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    user.move(info.delta.global);
  }
}

class Player extends SpriteComponent with HasGameRef<MainApp>
{
  @override
  FutureOr<void> onLoad() async{
    sprite = Sprite(game.images.fromCache("car.png"));
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
