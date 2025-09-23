import 'package:flame/game.dart';
import 'package:flapp_bird_game/views/game.dart';
import 'package:flutter/material.dart';

class FlappyBirdGameScreen extends StatelessWidget {
  const FlappyBirdGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: FlappyBirdGame());
  }
}