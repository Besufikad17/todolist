// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeAdapter extends TypeAdapter<Theme> {
  @override
  final int typeId = 5;

  @override
  Theme read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Theme(
      fields[0] as MyAppTheme,
    );
  }

  @override
  void write(BinaryWriter writer, Theme obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.theme);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MyAppThemeAdapter extends TypeAdapter<MyAppTheme> {
  @override
  final int typeId = 4;

  @override
  MyAppTheme read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MyAppTheme.lightGruvBox;
      case 1:
        return MyAppTheme.darkGruvBox;
      default:
        return MyAppTheme.lightGruvBox;
    }
  }

  @override
  void write(BinaryWriter writer, MyAppTheme obj) {
    switch (obj) {
      case MyAppTheme.lightGruvBox:
        writer.writeByte(0);
        break;
      case MyAppTheme.darkGruvBox:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyAppThemeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
