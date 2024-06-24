enum Color { red, green, orange, yellow }

class Spaceship {
  int xPosition, yPosition, speed, lifePoints;
  Color color;

  Spaceship(this.xPosition, this.yPosition, this.speed, this.lifePoints, this.color);

  int move() {
    xPosition += speed;
    yPosition += speed;
    return xPosition;
  }

  int damagePlayer(int damage) {
    lifePoints -= damage;
    return lifePoints;
  }

  bool isDestroyed() {
    return lifePoints <= 0;
  }

  void changeColor(Color newColor) {
    print('Farbe auf $newColor gewechselt');
  }
}
