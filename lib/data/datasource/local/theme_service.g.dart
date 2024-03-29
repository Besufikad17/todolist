// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_service.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeModelAdapter extends TypeAdapter<ThemeModel> {
  @override
  final int typeId = 5;

  @override
  ThemeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ThemeModel(
      fields[0] as MyAppTheme,
    );
  }

  @override
  void write(BinaryWriter writer, ThemeModel obj) {
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
      other is ThemeModelAdapter &&
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
      case 2:
        return MyAppTheme.light;
      case 3:
        return MyAppTheme.dark;
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
      case MyAppTheme.light:
        writer.writeByte(2);
        break;
      case MyAppTheme.dark:
        writer.writeByte(3);
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
