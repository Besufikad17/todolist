import 'package:todolist/data/datasource/local/theme_service.dart';

abstract class ThemeRepository {
  Future<void> changeTheme (ThemeModel theme);

  Future<void> addTheme (ThemeModel theme);

  Future<ThemeModel?> getTheme ();
}