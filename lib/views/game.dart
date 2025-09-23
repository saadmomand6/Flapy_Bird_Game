import 'dart:async';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flapp_bird_game/modules/bird/bird.dart';

class FlappyBirdGame extends FlameGame with TapDetector{


  late Bird bird;


  // load
  @override
  FutureOr<void> onLoad(){
    // load bird
    bird = Bird();
    add(bird);
  }
}