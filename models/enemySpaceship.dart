import 'playerSpaceship.dart';
import 'spaceship.dart';

class EnemySpaceship extends Spaceship {
  EnemySpaceship(super.xPosition, super.yPosition, super.speed, super.lifePoints, super.color);

  int attackPlayer(PlayerSpaceship player, int damage) {
    return player.damagePlayer(damage);
  }

  String collision() {
    return "Spieler wurde angegriffen";
  }
}
