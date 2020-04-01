import '../data/main.dart';
import 'main.dart';

class GameHelpers {
  GameData data;
  GameHelpers(this.data);

  jail(int player) {
    data.players[player].jailed = true;
    data.players[player].jailTries = 3;
    data.players[player].position = 10;
    Game.save();
  }
}
