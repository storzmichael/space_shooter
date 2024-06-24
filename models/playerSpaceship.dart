import 'spaceship.dart';

class PlayerSpaceship extends Spaceship {
  PlayerSpaceship(super.xPosition, super.yPosition, super.speed, super.lifePoints, super.color);

  String fireMissile() {
    return "Peng Peng!";
  }

  int missileDamage(int damage) {
    return damage;
  }
}
