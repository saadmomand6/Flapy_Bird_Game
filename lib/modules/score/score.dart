import 'dart:async';
import 'package:flame/components.dart';
import 'package:flapp_bird_game/views/game.dart';
import 'package:flutter/material.dart';

class ScoreText extends TextComponent with HasGameRef<FlappyBirdGame>{
// init
ScoreText()  : super(text: "0", textRenderer: TextPaint(
  style: TextStyle(
    color: Colors.black,
    fontSize: 48,
    fontWeight: FontWeight.bold
  )
));


// on load
@override
  FutureOr<void> onLoad() {
    // set position to lower middle
    position = Vector2(
      // center horizontally
      (gameRef.size.x - size.x) /  2 ,
      // slightly above bottom
      gameRef.size.y - size.y -50,
      );
  }


  // update
  @override
  void update(double dt){
final newText = gameRef.score.toString();
if(text != newText){
  text = newText;
}
  }
}