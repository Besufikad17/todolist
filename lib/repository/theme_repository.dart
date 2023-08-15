import 'package:hive/hive.dart';
import 'package:todolist/models/theme.dart';

class ThemeRepository {
  final Box<Theme> _themeBox = Hive.box('theme');

  void changeTheme (Theme theme) async {
    _themeBox.put('theme', theme);
  }

  void addTheme (Theme theme) async {
    _themeBox.put('theme', theme);
  }

  Future<Theme?> getTheme () async {
    return _themeBox.get('theme');
  }

}