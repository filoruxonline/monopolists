import 'package:hive/hive.dart';

import 'map.dart';
import 'player.dart';

part 'main.g.dart';

@HiveType(typeId: 1)
class GameData extends HiveObject {
  @HiveField(0)
  bool running = false;
  @HiveField(1)
  List<Player> players = [];
  @HiveField(2)
  int currentPlayer = 0;
  @HiveField(3)
  int turn = 0;
  @HiveField(4)
  List<int> currentDices = [1, -1];
  @HiveField(5)
  int doublesThrown = 0;
  @HiveField(6)
  double pot = 0;
  @HiveField(7)
  List<Tile> gmap = defaultMap;

  Player get player {
    return players[currentPlayer];
  }
}
