import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flapp_bird_game/constants/constants.dart';
import 'package:flapp_bird_game/views/game.dart';

class Pilar extends  SpriteComponent with CollisionCallbacks , HasGameRef<FlappyBirdGame>{
// determine pilar is top or bottom
final bool isTopPilar;

// init
Pilar(Vector2 position , Vector2 size, this.isTopPilar) : super(position: position, size: size);

// on load
@override
FutureOr<void> onLoad() async{
  // load sprite image
  sprite  = await Sprite.load(isTopPilar ? "top_pilar.png" : "bottom_pilar.png");

  // add hibox for collision
  add(RectangleHitbox());
}


// update
@override
  void update(double dt) {
    // move pilar to left
    position.x -= groundScrollingSpeed * dt;

    // remove the pipe if it go off the screen
    if(position.x + size.x <= 0 ) {
      removeFromParent();
    }
  }
}