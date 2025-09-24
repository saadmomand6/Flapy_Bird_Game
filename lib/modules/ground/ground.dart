import 'dart:async';
import 'package:flame/components.dart';
import 'package:flapp_bird_game/views/game.dart';

class Ground extends SpriteComponent with HasGameRef<FlappyBirdGame>{
  // initialize ground
  Ground() : super();

  // Load
  @override
  FutureOr<void> onLoad() async{
    //  set size and position
    size = Vector2(gameRef.size.x, 200);
    position = Vector2(0, gameRef.size.y - 200);

    // load sprite ground iamge
    sprite = await Sprite.load("ground.png");
  }
}