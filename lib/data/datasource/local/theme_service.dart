import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'theme_service.g.dart';

@HiveType(typeId: 4)
enum MyAppTheme {
  @HiveField(0)
  lightGruvBox,

  @HiveField(1)
  darkGruvBox
}

@HiveType(typeId: 5)
class ThemeModel extends Equatable {
  @HiveField(0)
  final MyAppTheme theme;

  const ThemeModel(this.theme);
  
  @override
  List<Object?> get props => throw [theme];
}