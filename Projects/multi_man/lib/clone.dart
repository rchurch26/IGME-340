//Couldn't implement
import 'dart:async';
import 'package:flame/components.dart';
import 'package:multi_man/player.dart';

class Clone extends Player
{
  final Vector2 clonePos;

  Clone({required this.clonePos});

  @override
  Future<void> onLoad() async{
    sprite = Sprite(game.images.fromCache("car.png"));
    anchor = Anchor.center;
    height = 100;
    width = 100;
    position = position + (clonePos - position).normalized();
  }
}
