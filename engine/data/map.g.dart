// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TileTypeAdapter extends TypeAdapter<TileType> {
  @override
  final typeId = 3;

  @override
  TileType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TileType.land;
      case 1:
        return TileType.company;
      case 2:
        return TileType.trainstation;
      case 3:
        return TileType.start;
      case 4:
        return TileType.chest;
      case 5:
        return TileType.tax;
      case 6:
        return TileType.chance;
      case 7:
        return TileType.jail;
      case 8:
        return TileType.parking;
      case 9:
        return TileType.police;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, TileType obj) {
    switch (obj) {
      case TileType.land:
        writer.writeByte(0);
        break;
      case TileType.company:
        writer.writeByte(1);
        break;
      case TileType.trainstation:
        writer.writeByte(2);
        break;
      case TileType.start:
        writer.writeByte(3);
        break;
      case TileType.chest:
        writer.writeByte(4);
        break;
      case TileType.tax:
        writer.writeByte(5);
        break;
      case TileType.chance:
        writer.writeByte(6);
        break;
      case TileType.jail:
        writer.writeByte(7);
        break;
      case TileType.parking:
        writer.writeByte(8);
        break;
      case TileType.police:
        writer.writeByte(9);
        break;
    }
  }
}

class TileAdapter extends TypeAdapter<Tile> {
  @override
  final typeId = 2;

  @override
  Tile read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tile(
      fields[0] as TileType,
      color: fields[1] as int,
      id: fields[2] as String,
      name: fields[3] as String,
      price: fields[4] as int,
      housePrice: fields[6] as int,
      rent: (fields[7] as List)?.cast<int>(),
      hyp: fields[5] as int,
    )
      ..sold = fields[8] as bool
      ..level = fields[9] as int;
  }

  @override
  void write(BinaryWriter writer, Tile obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.color)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.hyp)
      ..writeByte(6)
      ..write(obj.housePrice)
      ..writeByte(7)
      ..write(obj.rent)
      ..writeByte(8)
      ..write(obj.sold)
      ..writeByte(9)
      ..write(obj.level);
  }
}
