import '../../data/main.dart';

class Bank {
  bool activated = false;
  GameData data;
  Bank(this.data, this.activated);
  void rent() {
    if (activated) {
      data.player.money += data.player.money * 0.02;
    }
  }
}
