// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookHistoryModelAdapter extends TypeAdapter<BookHistoryModel> {
  @override
  final int typeId = 0;

  @override
  BookHistoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookHistoryModel(
      title: fields[1] as String,
      author: fields[2] as String,
      imageUrl: fields[3] as String,
      id: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, BookHistoryModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookHistoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
