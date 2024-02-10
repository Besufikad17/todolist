import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todolist/config/router/args.dart';
import 'package:todolist/data/datasource/local/local_list_service.dart';
import 'package:todolist/data/datasource/local/local_todo_service.dart';
import 'package:todolist/data/repository/local_todo_repository_impl.dart';
import 'package:todolist/locator.dart';
import 'package:todolist/presentation/bloc/todo_bloc.dart';
import 'package:todolist/presentation/components/app_bar.dart';
import 'package:todolist/presentation/components/button.dart';
import 'package:todolist/presentation/components/popup.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  
  TextEditingController text = TextEditingController();
  LocalTodoRepositoryImpl repository = LocalTodoRepositoryImpl(locator.get<Box<LocalTodo>>());

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as TodoPageArgs;

    return MaterialApp(
      title: args.title,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: MyAppBar(title: args.title)
        ),
        body: BlocProvider(
          create: (context) => TodoBloc(repository)..add(GetTodo(args.title)),
          child: BlocConsumer<TodoBloc, TodoState>(
              listener: (context, state) => {},
              builder: (BuildContext context, TodoState state) {
                if (state is TodoInitial) {
                  return _buildInitial(context.read<TodoBloc>(), args.title);
                } else if (state is TodoLoading) {
                  return _buildLoading();
                } else if (state is TodoLoaded) {
                  return _buildLoaded(context.read<TodoBloc>(), state, args.title);
                }
                return Container();
              }),
        ),
      ),
    );
  }

  Widget _buildInitial(TodoBloc bloc, String title) {
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

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildLoaded(TodoBloc bloc, TodoLoaded state, String title) {
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
