import 'dart:async';
import 'player.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

void main() {
  runApp(GameWidget(game: MainApp(),),);
}

class MainApp extends FlameGame with TapCallbacks{
  late Player mp;
  late Vector2 tapLoc;

  @override
  Future<void> onLoad() async{
    await images.loadAll([
      "car.png",
    ]);

    mp = Player();
    add(mp);
  }

  @override
  void onTapUp(TapUpEvent event) {
    super.onTapUp(event);
    tapLoc = event.localPosition;
    print(tapLoc);
    mp.moveToLoc(tapLoc);
  }
}
