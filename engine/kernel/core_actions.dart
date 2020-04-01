import '../data/main.dart';
import '../data/map.dart';

enum payType { rent, bank, pot, pay }

class CoreActions {
  GameData data;
  CoreActions(this.data);
  void pay(payType type, int amount, [int receiver]) {
    data.player.money -= amount;
    switch (type) {
      case payType.rent:
        data.players[receiver].money += amount;
        break;
      case payType.pot:
        data.pot += amount;
        break;
      default:
    }
  }

  void deal(
      {int amount,
      List<int> aProperties,
      List<int> receiveProperties,
      int dealer}) {
    if (amount != null) {
      pay(payType.pay, amount, dealer);
    }
    var aProp = data.player.properties;
    var bProp = data.players[dealer].properties;
    if (aProperties != null) {
      for (int i = 0; i < aProperties.length | 0; i++) {
        aProp.remove(aProperties[i]);
        bProp.add(aProperties[i]);
      }
    }
    if (receiveProperties != null) {
      for (int i = 0; i < receiveProperties.length; i++) {
        bProp.remove(receiveProperties[i]);
        aProp.add(receiveProperties[i]);
      }
    }
  }

  void buy([int prop]) {
    if (prop == null) {
      prop = data.player.position;
    }
    if (data.gmap[prop].type == TileType.land ||
        data.gmap[prop].type == TileType.trainstation ||
        data.gmap[prop].type == TileType.company) {
      data.player.money -= data.gmap[prop].price;
      data.player.properties.add(prop);
    }
  }
}
