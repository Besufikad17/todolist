import 'package:hive/hive.dart';
import 'package:todolist/data/datasource/local/theme_service.dart';
import 'package:todolist/domain/repository/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final Box<ThemeModel> _themeBox;

  const ThemeRepositoryImpl(this._themeBox);

  @override
  Future<void> addTheme(theme) async {
    await _themeBox.put('theme', theme);
  }

  @override
  Future<void> changeTheme(theme) async {
    await _themeBox.put('theme', theme);
  }

  @override
  Future<ThemeModel?> getTheme() async {
    return _themeBox.get('theme');
  }
}