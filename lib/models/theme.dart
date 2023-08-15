import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:todolist/global/theme/themes.dart';

part 'theme.g.dart';

@HiveType(typeId: 4)
enum MyAppTheme {
  @HiveField(0)
  lightGruvBox,

  @HiveField(1)
  darkGruvBox
}

@HiveType(typeId: 5)
class Theme extends Equatable {
  @HiveField(0)
  final MyAppTheme theme;

  const Theme(this.theme);
  
  @override
  List<Object?> get props => throw [theme];
}