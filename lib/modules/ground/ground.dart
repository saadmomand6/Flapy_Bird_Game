import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flapp_bird_game/constants/constants.dart';
import 'package:flapp_bird_game/views/game.dart';

class Ground extends SpriteComponent with HasGameRef<FlappyBirdGame> , CollisionCallbacks{
  // initialize ground
  Ground() : super();

  // Load
  @override
  FutureOr<void> onLoad() async{
    //  set size and position(2* for infinite scroll)
    size = Vector2(2* gameRef.size.x, 200);
    position = Vector2(0, gameRef.size.y - 200);

    // load sprite ground iamge
    sprite = await Sprite.load("ground.png");

    // add a collision box
    add(RectangleHitbox());
  }


// update every second
@override
void update(double dt){
  // move ground to left
  position.x -= groundScrollingSpeed * dt;

// reset the ground if it go off the screen for infinite scroll
// if half of ground is passed so then reset it
if(position.x + size.x / 2 <= 0){
  // reset
  position.x = 0;

} 
}
}