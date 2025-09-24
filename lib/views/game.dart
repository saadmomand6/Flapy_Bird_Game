import 'dart:async';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flapp_bird_game/modules/background/background.dart';
import 'package:flapp_bird_game/modules/bird/bird.dart';
import 'package:flapp_bird_game/modules/ground/ground.dart';

class FlappyBirdGame extends FlameGame with TapDetector{


  late Bird bird;
  late Background background;
  late Ground ground;


  // load
  @override
  FutureOr<void> onLoad(){
    // load background
    background = Background(size);
    add(background);
    // load ground
    ground = Ground();
    add(ground);
    // load bird
    bird = Bird();
    add(bird);
  }

  //  Tap
  void onTap(){
    bird.flap();
  }
}