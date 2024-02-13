// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_todo_service.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalTodoAdapter extends TypeAdapter<LocalTodo> {
  @override
  final int typeId = 1;

  @override
  LocalTodo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalTodo(
      title: fields[0] as String,
      lists: (fields[1] as List).cast<LocalList>(),
      status: fields[3] as TodoStatus?,
      createdAt: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, LocalTodo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.lists)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalTodoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TodoStatusAdapter extends TypeAdapter<TodoStatus> {
  @override
  final int typeId = 0;

  @override
  TodoStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TodoStatus.pending;
      case 1:
        return TodoStatus.archived;
      default:
        return TodoStatus.pending;
    }
  }

  @override
  void write(BinaryWriter writer, TodoStatus obj) {
    switch (obj) {
      case TodoStatus.pending:
        writer.writeByte(0);
        break;
      case TodoStatus.archived:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
