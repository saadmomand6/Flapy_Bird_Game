import 'dart:math';
import 'package:flame/components.dart';
import 'package:flapp_bird_game/constants/constants.dart';
import 'package:flapp_bird_game/modules/pilars/pilars.dart';
import 'package:flapp_bird_game/views/game.dart';

class PilarManager extends Component with HasGameRef<FlappyBirdGame>{

  // update every second
  //  we will continously spawn new pilar


  double pilarSpawnTimer = 0;

  @override
  void update(double dt) {
    // generate new pilar on given interval
    pilarSpawnTimer += dt;
    

    if (pilarSpawnTimer > pilarInterval) {
      pilarSpawnTimer = 0;
      spawnPilar();
    }
  }

  // spawn new pilars
void spawnPilar(){
final double screenHeight = gameRef.size.y;



// calculate pilar heights
// max posible pilar height
final double maxPilarHeight = screenHeight - groundHeight - pilarGap - minPilarHeight;

// height of bottom pilar => randomely select between min and max
final double bottomPilarHeight = minPilarHeight + Random().nextDouble() * (maxPilarHeight - minPilarHeight);

// height of top pilar 
final double topPilarHeight = screenHeight - groundHeight - bottomPilarHeight - pilarGap;


// create bottom pilar
final bottomPilar = Pilar(
  // position
  Vector2(gameRef.size.x, screenHeight - groundHeight - bottomPilarHeight), 
  // size
  Vector2(minPilarWidth,  bottomPilarHeight),  
  // isTopPilar
  false
  );


// create top pilar
final topPilar = Pilar(
  // position
  Vector2(gameRef.size.x, 0), 
  // size
  Vector2(minPilarWidth,  topPilarHeight),  
  // isTopPilar
  true
  );


// add both pilars to game
gameRef.add(bottomPilar);
gameRef.add(topPilar);
}
}