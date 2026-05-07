// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyListModelAdapter extends TypeAdapter<MyListModel> {
  @override
  final int typeId = 0;

  @override
  MyListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyListModel(
      id: fields[0] as int,
      title: fields[1] as String,
      author: fields[2] as String,
      image: fields[3] as String,
      category: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MyListModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
