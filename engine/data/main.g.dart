// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameDataAdapter extends TypeAdapter<GameData> {
  @override
  final typeId = 1;

  @override
  GameData read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameData()
      ..running = fields[0] as bool
      ..players = (fields[1] as List)?.cast<Player>()
      ..currentPlayer = fields[2] as int
      ..turn = fields[3] as int
      ..currentDices = (fields[4] as List)?.cast<int>()
      ..doublesThrown = fields[5] as int
      ..pot = fields[6] as double
      ..gmap = (fields[7] as List)?.cast<Tile>();
  }

  @override
  void write(BinaryWriter writer, GameData obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.running)
      ..writeByte(1)
      ..write(obj.players)
      ..writeByte(2)
      ..write(obj.currentPlayer)
      ..writeByte(3)
      ..write(obj.turn)
      ..writeByte(4)
      ..write(obj.currentDices)
      ..writeByte(5)
      ..write(obj.doublesThrown)
      ..writeByte(6)
      ..write(obj.pot)
      ..writeByte(7)
      ..write(obj.gmap);
  }
}
