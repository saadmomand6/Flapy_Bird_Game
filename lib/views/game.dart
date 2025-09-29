import 'dart:async';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flapp_bird_game/constants/constants.dart';
import 'package:flapp_bird_game/modules/background/background.dart';
import 'package:flapp_bird_game/modules/bird/bird.dart';
import 'package:flapp_bird_game/modules/ground/ground.dart';
import 'package:flapp_bird_game/modules/pilars/pilar_manager.dart';
import 'package:flapp_bird_game/modules/pilars/pilars.dart';
import 'package:flutter/material.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  late Background background;
  late Ground ground;
  late PilarManager pilarManager;

  // load
  @override
  FutureOr<void> onLoad() {
    // load background
    background = Background(size);
    add(background);
    // load bird
    bird = Bird();
    add(bird);

    // load ground
    ground = Ground();
    add(ground);

    // load pilars
    pilarManager  = PilarManager();
    add(pilarManager);
  }

  //  Tap
  void onTap() {
    bird.flap();
  }

  // Game over
  bool isGameOver = false;

  void gameOver() {
    // prevent multiple gameover triggers
    if (isGameOver) return;
    isGameOver = true;
    pauseEngine();

    // reset game
    void resetGame() {
      bird.position = Vector2(birdStartX, birdStartY);
      bird.velocity = 0;
      isGameOver = false;
      // remove all pilars from game
      children.whereType<Pilar>().forEach((pilar)=> pilar.removeFromParent());
      resumeEngine();
    }

    // show dailog box for user
    showDialog(
      context: buildContext!,
      builder: (context) => AlertDialog(
        title: const Text("Game Over"),
        actions: [
          TextButton(
            onPressed: () {
              // pop box
              Navigator.pop(context);
              // reset game
              resetGame();
            },
            child: const Text("Restart"),
          ),
        ],
      ),
    );
  }
}
