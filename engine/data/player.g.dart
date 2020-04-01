// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlayerAdapter extends TypeAdapter<Player> {
  @override
  final typeId = 4;

  @override
  Player read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Player(
      money: fields[1] as double,
      id: fields[3] as int,
      color: fields[4] as int,
      position: fields[2] as int,
      name: fields[0] as String,
    )
      ..properties = (fields[5] as List)?.cast<int>()
      ..jailed = fields[6] as bool
      ..jailTries = fields[7] as int
      ..goojCards = fields[8] as int;
  }

  @override
  void write(BinaryWriter writer, Player obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.money)
      ..writeByte(2)
      ..write(obj.position)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.color)
      ..writeByte(5)
      ..write(obj.properties)
      ..writeByte(6)
      ..write(obj.jailed)
      ..writeByte(7)
      ..write(obj.jailTries)
      ..writeByte(8)
      ..write(obj.goojCards);
  }
}
