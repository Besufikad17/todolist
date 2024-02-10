import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todolist/data/datasource/local/local_todo_service.dart';
import 'package:todolist/data/datasource/local/theme_service.dart';
import 'package:todolist/data/repository/local_todo_repository_impl.dart';
import 'package:todolist/data/repository/theme_repository_impl.dart';
import 'package:todolist/locator.dart';
import 'package:todolist/presentation/bloc/theme_bloc.dart';
import 'package:todolist/presentation/bloc/todo_bloc.dart';
import 'package:todolist/presentation/components/button.dart';
import 'package:todolist/presentation/components/card.dart';
import 'package:todolist/presentation/components/popup.dart';
import 'package:todolist/config/theme/themes.dart';
import 'package:todolist/presentation/screens/preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(ThemeRepositoryImpl(locator.get<Box<ThemeModel>>()))..add(const GetTheme()),
      child: BlocConsumer<ThemeBloc, ThemeState>(
        listener:(context, state) {},
        builder: (context, state) {
          if(state is ThemeInitial) {
            context.read<ThemeBloc>().add(const AddTheme(ThemeModel(MyAppTheme.lightGruvBox)));
            return MaterialApp(
              title: 'TodoList',
              theme: appThemeData[MyAppTheme.lightGruvBox],
              home: MyHomePage(title: 'Home', themeBloc: context.read<ThemeBloc>(),),
            );
          }else {
            return MaterialApp(
              title: 'TodoList',
              theme: appThemeData[state.appTheme],
              home: MyHomePage(title: 'Home', themeBloc: context.read<ThemeBloc>(),),
            );
          }     
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.themeBloc});
  final String title;
  final ThemeBloc themeBloc;

  @override
  State<MyHomePage> createState() => _MyHomePageState(themeBloc);
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController text = TextEditingController();
  LocalTodoRepositoryImpl repository = LocalTodoRepositoryImpl(locator.get<Box<LocalTodo>>());
  final ThemeBloc themeBloc;

  _MyHomePageState(this.themeBloc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title, style: Theme.of(context).textTheme.displayLarge),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PreferencePage(bloc: themeBloc),
                ));
              },
            )
          ]),
      body: BlocProvider(
        create: (context) => TodoBloc(repository)..add(const GetAllTodos()),
        child: BlocConsumer<TodoBloc, TodoState>(
          listener: (context, state) => {},
          builder: (BuildContext context, TodoState state) {
            if (state is TodoInitial) {
              return buildInitialInput(context.read<TodoBloc>());
            } else if (state is TodoLoading) {
              return buildLoading();
            } else if (state is TodosLoaded) {
              return buildWithLoaded(state.todos, context.read<TodoBloc>());
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget buildInitialInput(TodoBloc bloc) {
    return Center(
      child: ElevatedButton(
        onPressed: () => {
          showDialog(
              context: context,
              builder: (context) {
                return Popup(text: text, bloc: bloc, flag: "todo");
              })
        },
        child: const Row(
          children: [Text("Add"), Icon(Icons.add)],
        ),
      ),
    );
  }

  Widget buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildWithLoaded(List<LocalTodo> todos, TodoBloc bloc) {
    return Column(children: [
      Expanded(
        child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              return MyCard(title: todos[index].title);
            }),
      ),
      MyButton(
        text: "Add todo",
        width: 250,
        height: 40,
        onPressed: () => {
          showDialog(
              context: context,
              builder: (context) {
                return Popup(text: text, bloc: bloc, flag: "todo");
              })
        },
      ),
    ]);
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
