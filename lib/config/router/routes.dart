import 'package:todolist/presentation/screens/archive.dart';
import 'package:todolist/presentation/screens/home.dart';
import 'package:todolist/presentation/screens/settings.dart';
import 'package:todolist/presentation/screens/todo.dart';

final routes = {
  '/' : (context) => HomePage(),
  '/todo': (context) => const TodoPage(),
  '/archive': (context) => ArchivePage(),
  '/settings': (context) => const SettingsPage()
};