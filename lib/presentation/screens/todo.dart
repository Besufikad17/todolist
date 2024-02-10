import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todolist/data/datasource/local/local_list_service.dart';
import 'package:todolist/data/datasource/local/local_todo_service.dart';
import 'package:todolist/data/repository/local_todo_repository_impl.dart';
import 'package:todolist/locator.dart';
import 'package:todolist/presentation/bloc/theme_bloc.dart';
import 'package:todolist/presentation/bloc/todo_bloc.dart';
import 'package:todolist/presentation/components/button.dart';
import 'package:todolist/presentation/components/popup.dart';
import 'package:todolist/presentation/screens/preference.dart';

class TodoPage extends StatefulWidget {
  final String title;
  TodoPage({super.key, required this.title});

  @override
  State<TodoPage> createState() => _TodoPageState(title: title);
}

class _TodoPageState extends State<TodoPage> {
  final String title;
  _TodoPageState({required this.title});
  TextEditingController text = TextEditingController();
  LocalTodoRepositoryImpl repository = LocalTodoRepositoryImpl(locator.get<Box<LocalTodo>>());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(title, style: Theme.of(context).textTheme.displayLarge),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PreferencePage(
                    bloc: context.read<ThemeBloc>(),
                  ),
                ));
              },
            )
          ],
        ),
        body: BlocProvider(
          create: (context) => TodoBloc(repository)..add(GetTodo(title)),
          child: BlocConsumer<TodoBloc, TodoState>(
              listener: (context, state) => {},
              builder: (BuildContext context, TodoState state) {
                if (state is TodoInitial) {
                  return buildInitialInput(context.read<TodoBloc>());
                } else if (state is TodoLoading) {
                  return buildLoading();
                } else if (state is TodoLoaded) {
                  return _buildLoaded(context.read<TodoBloc>(), state);
                }
                return Container();
              }),
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
                return Popup(
                  text: text,
                  bloc: bloc,
                  flag: "list",
                  todoTitle: title,
                );
              })
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildLoaded(TodoBloc bloc, TodoLoaded state) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: state.todo.lists.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(
                    state.todo.lists[index].title,
                    style: TextStyle(
                      decoration:
                          state.todo.lists[index].status == ListStatus.completed
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                    ),
                  ),
                  checkColor: Colors.white,
                  value: state.todo.lists[index].status == ListStatus.completed,
                  onChanged: (bool? value) {
                    if (value ?? false) {
                      bloc.add(UpdateListStatus(ListStatus.completed,
                          state.todo.lists[index].title, title));
                    } else {
                      bloc.add(UpdateListStatus(ListStatus.pending,
                          state.todo.lists[index].title, title));
                    }
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                );
              }),
        ),
        MyButton(
          text: "Add list",
          width: 250,
          height: 40,
          onPressed: () => {
            showDialog(
                context: context,
                builder: (context) {
                  return Popup(
                    text: text,
                    bloc: bloc,
                    flag: "list",
                    todoTitle: title,
                  );
                })
          },
        ),
      ],
    );
  }
}
