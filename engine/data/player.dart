import 'package:hive/hive.dart';

part 'player.g.dart';

@HiveType(typeId: 4)
class Player extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  double money;
  @HiveField(2)
  int position;
  @HiveField(3)
  int id;
  @HiveField(4)
  int color;
  @HiveField(5)
  List<int> properties = [];
  @HiveField(6)
  bool jailed = false;
  @HiveField(7)
  int jailTries = 0;
  @HiveField(8)
  int goojCards = 0;
  Player(
      {this.money = 0,
      this.id = 0,
      this.color = 0,
      this.position: 0,
      this.name}) {
    if (name == null) {
      name = "Player $id";
    }
  }
}
