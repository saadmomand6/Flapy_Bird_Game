import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flapp_bird_game/constants/constants.dart';
import 'package:flapp_bird_game/modules/ground/ground.dart';
import 'package:flapp_bird_game/modules/pilars/pilars.dart';
import 'package:flapp_bird_game/views/game.dart';

class Bird extends SpriteComponent with CollisionCallbacks{
  // initialize bird position and size
  Bird() : super(position: Vector2(birdStartX, birdStartY), size: Vector2(birdWidth, birdHeight));

  //  bird velocity
  double velocity  = 0;
  // load

  @override
  FutureOr<void> onLoad() async{
    // load bird sprite image
    sprite = await Sprite.load("bird.png");

    // add hit box
    add(RectangleHitbox());
  }

  // Jump / Flap
  void flap(){
    velocity = jumpStrength;
  }

  // update every second
  @override
  void update(double dt){
    // apply gravity
    velocity += gravity * dt;

    // update bird position based on current velocity
    position.y += velocity * dt; 
  }


  // collision with another box
  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
    
    // check if bird collide with box
    if (other is Ground) {
      (parent as FlappyBirdGame).gameOver();
    } 

    // check bird collide with pilars
    if(other is Pilar){
      (parent as FlappyBirdGame).gameOver();
    }
  }
}