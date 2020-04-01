import '../data/main.dart';
import '../data/player.dart';
import 'main.dart';

class GameSetup {
  GameData data;
  GameSetup(this.data);

  addPlayer({String name}) {
    int id = data.players.length;
    data.players.add(Player(money: 750, id: id, color: id, name: name));
    Game.save();
  }

  deleteLastPlayer() {
    data.players.removeLast();
    Game.save();
  }
}
