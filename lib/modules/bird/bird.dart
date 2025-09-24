import 'dart:async';

import 'package:flame/components.dart';
import 'package:flapp_bird_game/constants/constants.dart';

class Bird extends SpriteComponent{
  // initialize bird position and size
  Bird() : super(position: Vector2(birdStartX, birdStartY), size: Vector2(birdWidth, birdHeight));

  

  // load

  @override
  FutureOr<void> onLoad() async{
    // load bird sprite image
    sprite = await Sprite.load("bird.png");
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
}