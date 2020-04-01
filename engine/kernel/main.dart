import '../../bloc/main_bloc.dart';
import '../data/main.dart';
import '../data/map.dart';
import '../data/player.dart';
import 'core_actions.dart';
import 'extensions/bank.dart';
import 'game_helpers.dart';
import 'game_setup.dart';

class Game {
  static GameData data;

  static Bank bank;
  static CoreActions act;
  static GameSetup setup;
  static GameHelpers helper;

  static bool testing;
  static save() {
    if (!(testing ?? false)) {
      data.save();
    }
  }

  //launching
  static newGame() {
    data = MainBloc.newGame();

    loadGame(data);
  }

  static loadGame(GameData loadData) {
    if (!(testing ?? false)) assert(data.isInBox);

    data = loadData;
    launch();
  }

  static build(int property) {
    data.player.money -= data.gmap[property].housePrice;
    data.gmap[property].level++;
    save();
  }

  static bool launch() {
    //basic
    setup = GameSetup(data);
    act = CoreActions(data);
    helper = GameHelpers(data);
    //extensions
    bank = Bank(data, true);
    if (data.players.length > 0) {
      data.currentPlayer = 0;
      save();
      return true;
    } else {
      return false;
    }
  }

  //basic interactions

  static unjail() {
    if (data.player.goojCards > 0) {
      data.player.goojCards--;
    } else {
      data.player.money -= 50;
    }
    data.player.jailed = false;
    save();
  }

  static void move(int dice1, int dice2) {
    var player = data.player;
    if (player.jailed) {
      if (dice1 == dice2 || player.jailTries == 1) {
        player.jailed = false;
        dice1--;
        dice2++;
      } else {
        player.jailTries--;
      }
    }
    var steps = dice1 + dice2;
    data.currentDices = [dice1, dice2];

    if (!player.jailed) {
      if (dice1 == dice2 && data.doublesThrown >= 2) {
        helper.jail(data.currentPlayer);
      }
      for (int i = 0; i < steps; i++) {
        if (player.position + 1 > data.gmap.length) {
          player.position = 0;
          bank.rent();
        } else {
          player.position++;
        }
      }
      switch (data.gmap[player.position].type) {
        case TileType.parking:
          data.player.money += data.pot;
          data.pot = 0;
          break;
        case TileType.police:
          data.player.jailed = true;
          data.player.jailTries = 3;
          break;
        default:
      }
    }
    save();
  }

  static Player next() {
    if (data.currentDices[0] == data.currentDices[1] && !data.player.jailed) {
      data.doublesThrown++;
    } else if (data.currentPlayer == data.players.length - 1) {
      data.currentPlayer = 0;
      data.turn++;
    } else {
      data.currentPlayer++;
    }
    bank.rent();
    save();
    return data.player;
  }
}
