import 'dart:async';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flapp_bird_game/constants/constants.dart';
import 'package:flapp_bird_game/modules/background/background.dart';
import 'package:flapp_bird_game/modules/bird/bird.dart';
import 'package:flapp_bird_game/modules/ground/ground.dart';
import 'package:flapp_bird_game/modules/pilars/pilar_manager.dart';
import 'package:flapp_bird_game/modules/pilars/pilars.dart';
import 'package:flapp_bird_game/modules/score/score.dart';
import 'package:flutter/material.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  late Background background;
  late Ground ground;
  late PilarManager pilarManager;
  late ScoreText scoreText;

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

    // load score
    scoreText  = ScoreText();
    add(scoreText);
  }

  //  Tap
  void onTap() {
    bird.flap();
  }

// Adding score functionality
int score = 0;

void incrementScore(){
  score += 1;
}

// high Score
int highscore =0;
void checkHighScore(){
  if(score > highscore){
    highscore = score;
  }
}

  // Game over
  bool isGameOver = false;

  void gameOver() {
    // prevent multiple gameover triggers
    if (isGameOver) return;
    isGameOver = true;
    pauseEngine();
    checkHighScore();

    // reset game
    void resetGame() {
      bird.position = Vector2(birdStartX, birdStartY);
      bird.velocity = 0;
      isGameOver = false;
      score = 0;
      // remove all pilars from game
      children.whereType<Pilar>().forEach((pilar)=> pilar.removeFromParent());
      resumeEngine();
    }

    // show dailog box for user
    showDialog(
    barrierDismissible: false,
  context: buildContext!,
  builder: (context) => AlertDialog(
    backgroundColor: const Color.fromARGB(255, 19, 167, 154),
    icon: const Icon(Icons.back_hand_rounded, color: Colors.black, size: 32),
    title: const Text(
      "Game Over",
      style: TextStyle(
        color: Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min, // 👈 keeps box small
      children: [
        Text(
          "High Score = $highscore",
          textAlign: TextAlign.center,
          style: const TextStyle(color: Color.fromARGB(255, 224, 210, 151), fontSize: 20),
        ),
        const SizedBox(height: 10),
        Text(
          "Your Score = $score",
          textAlign: TextAlign.center,
          style: const TextStyle(color:Color.fromARGB(255, 224, 210, 151), fontSize: 20),
        ),
      ],
    ),
    actionsAlignment: MainAxisAlignment.center, // 👈 center Restart button
    actions: [
      TextButton(
        onPressed: () {
          Navigator.pop(context);
          resetGame();
        },
        child: const Text(
          "Restart",
          style: TextStyle(color: Color.fromARGB(255, 34, 138, 37),fontSize: 18,fontWeight: FontWeight.bold,),
        ),
      ),
    ],
  ),
);
  }
}
