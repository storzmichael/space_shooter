class Healthstation {
  int xPosition, yPosition, healthPoints;

  Healthstation({required this.xPosition, required this.yPosition, required this.healthPoints});

  int healPlayer(PlayerSpaceship) {
    int healpoints = healthPoints;
    PlayerSpaceship.healthPoints += healpoints;
    return PlayerSpaceship.healthPoints;
  }

  String collision(PlayerSpaceship) {
    return 'Spieler wurde geheilt';
  }
}
