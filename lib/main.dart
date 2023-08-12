import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todolist/bloc/todo_bloc.dart';
import 'package:todolist/components/card.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:todolist/components/popup.dart';
import 'package:todolist/models/lists.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/repository/todo_repository.dart';


void main() async {
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(TodoAdapter());
  Hive.registerAdapter(ListsAdapter());
  Hive.registerAdapter(StatusAdapter());
  await Hive.openBox<Todo>('todos');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoList',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 34, 62, 138)),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController text = TextEditingController();
  final TodoRepository repository = TodoRepository();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocProvider(
        create: (context) => TodoBloc(repository)..add(const GetAllTodos()),
        child: BlocConsumer<TodoBloc, TodoState>(
            listener: (context, state) => {},
            builder: (BuildContext context, TodoState state) {
              if(state is TodoInitial) {
                return buildInitialInput(context.read<TodoBloc>());
              }else if(state is TodoLoading) {
                return buildLoading();
              }else if(state is TodosLoaded) {
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
            }
           )
        },
        child: const Row(children: [Text("Add"), Icon(Icons.add)],),
      ),
    );
  }

  Widget buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildWithLoaded(List<Todo> todos, TodoBloc bloc) {
    return Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (BuildContext context, int index) {
                 return MyCard(title: todos[index].title);
              }
            ),
          ),
          ElevatedButton(
            onPressed: () => {
               showDialog(
                context: context,
                builder: (context) {
                  return Popup(text: text, bloc: bloc, flag: "todo");
                }
               )
            },
            child: const Icon(Icons.add),
          ),
        ]);
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}


