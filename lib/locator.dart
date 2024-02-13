import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:get_it/get_it.dart';
import 'package:todolist/data/datasource/local/local_list_service.dart';
import 'package:todolist/data/datasource/local/local_todo_service.dart';
import 'package:todolist/data/datasource/local/theme_service.dart';
import 'package:todolist/data/repository/theme_repository_impl.dart';
import 'package:todolist/presentation/bloc/theme_bloc.dart';


final locator = GetIt.instance;

Future<void> initDependency() async {
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(LocalTodoAdapter());
  Hive.registerAdapter(TodoStatusAdapter());
  Hive.registerAdapter(LocalListAdapter());
  Hive.registerAdapter(ListStatusAdapter());
  Hive.registerAdapter(ThemeModelAdapter());
  Hive.registerAdapter(MyAppThemeAdapter());
  await Hive.openBox<LocalTodo>('todos');
  await Hive.openBox<ThemeModel>('theme');

  locator.registerSingleton<Box<LocalTodo>>(
    Hive.box('todos')
  );

  locator.registerSingleton<Box<ThemeModel>>(
    Hive.box('theme')
  );

  locator.registerSingleton<ThemeBloc>(
    ThemeBloc(ThemeRepositoryImpl(locator.get<Box<ThemeModel>>()))
  );
}