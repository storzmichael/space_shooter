import 'dart:math';

import 'models/enemySpaceship.dart';
import 'models/healthStation.dart';
import 'models/playerSpaceship.dart';
import 'models/spaceship.dart';

void main() {
  Random random = Random();
  List<EnemySpaceship> enemies = [];
  List<Healthstation> healthStations = [];
  PlayerSpaceship player = PlayerSpaceship(random.nextInt(300), random.nextInt(300), 5, 100, Color.green);

  EnemySpaceship enemy1 = EnemySpaceship(random.nextInt(300), random.nextInt(300), 10, 100, Color.red);
  EnemySpaceship enemy2 = EnemySpaceship(random.nextInt(300), random.nextInt(300), 10, 200, Color.red);
  EnemySpaceship enemy3 = EnemySpaceship(random.nextInt(300), random.nextInt(300), 10, 300, Color.red);
  EnemySpaceship enemy4 = EnemySpaceship(random.nextInt(300), random.nextInt(300), 10, 400, Color.red);

  enemies.addAll([enemy1, enemy2, enemy3, enemy4]);

  Healthstation hs1 = Healthstation(xPosition: random.nextInt(300), yPosition: random.nextInt(300), healthPoints: 20);
  Healthstation hs2 = Healthstation(xPosition: random.nextInt(300), yPosition: random.nextInt(300), healthPoints: 30);
  Healthstation hs3 = Healthstation(xPosition: random.nextInt(300), yPosition: random.nextInt(300), healthPoints: 40);

  healthStations.addAll([hs1, hs2, hs3]);

  int attackDamage = 10;

  Map<String, Map> level = {
    "Level 1": {
      "boundaryX": random.nextInt(300),
      "boundaryY": random.nextInt(300),
      "enemies": [enemy1],
      "healingStations": [hs1, hs2, hs3]
    },
    "Level 2": {
      "boundaryX": random.nextInt(300),
      "boundaryY": random.nextInt(300),
      "enemies": [enemy1, enemy2],
      "healingStations": [hs1, hs2, hs3]
    },
    "Level 3": {
      "boundaryX": random.nextInt(300),
      "boundaryY": random.nextInt(300),
      "enemies": [enemy1, enemy2, enemy3],
      "healingStations": [hs1, hs2, hs3]
    },
    "Level 4": {
      "boundaryX": random.nextInt(300),
      "boundaryY": random.nextInt(300),
      "enemies": [enemy1, enemy2, enemy3, enemy4],
      "healingStations": [hs1, hs2, hs3]
    },
  };

  for (String levelName in level.keys) {
    print("Start $levelName");

    Map? currentLevel = level[levelName];
    List<EnemySpaceship> enemies = currentLevel?["Gegner"];
    List<Healthstation> healthStations = currentLevel?["Heilungstation"];

    while (true) {
      player.move();

      print(player.fireMissile());

      for (EnemySpaceship enemy in enemies) {
        enemy.lifePoints = enemy.lifePoints - attackDamage;
      }

      for (EnemySpaceship enemy in enemies) {
        if (enemy.xPosition == player.xPosition && enemy.yPosition == player.yPosition) {
          player.lifePoints -= attackDamage;
          print(enemy.collision());
        }
      }

      for (Healthstation healthstation in healthStations) {
        if (player.xPosition == healthstation.xPosition && player.yPosition == healthstation.yPosition) {
          healthstation.healPlayer(player);
          print(healthstation.collision(PlayerSpaceship));
        }
      }

      if (player.isDestroyed()) {
        print("Spieler hat verloren!");
        break;
      }

      bool allEnemiesDestroyed = enemies.every((enemy) => enemy.isDestroyed());

      if (allEnemiesDestroyed) {
        print("Du hast den $levelName geschafft!");
        break;
      }
    }
  }
}
