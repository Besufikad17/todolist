import 'package:todolist/domain/models/lists.dart';
import 'package:todolist/domain/models/theme.dart';
import 'package:todolist/domain/models/todo.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void initHive() async {
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(TodoAdapter());
    Hive.registerAdapter(ListsAdapter());
    Hive.registerAdapter(StatusAdapter());
    Hive.registerAdapter(ThemeAdapter());
    Hive.registerAdapter(MyAppThemeAdapter());
    await Hive.openBox<Todo>('todos');
    await Hive.openBox<Theme>('theme');
}