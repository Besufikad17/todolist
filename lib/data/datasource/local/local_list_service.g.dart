// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_list_service.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalListAdapter extends TypeAdapter<LocalList> {
  @override
  final int typeId = 2;

  @override
  LocalList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalList(
      title: fields[0] as String,
      status: fields[1] as ListStatus,
    );
  }

  @override
  void write(BinaryWriter writer, LocalList obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ListStatusAdapter extends TypeAdapter<ListStatus> {
  @override
  final int typeId = 3;

  @override
  ListStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ListStatus.pending;
      case 1:
        return ListStatus.completed;
      default:
        return ListStatus.pending;
    }
  }

  @override
  void write(BinaryWriter writer, ListStatus obj) {
    switch (obj) {
      case ListStatus.pending:
        writer.writeByte(0);
        break;
      case ListStatus.completed:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
