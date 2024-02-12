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
import 'package:todolist/presentation/components/app_bar.dart';
import 'package:todolist/presentation/components/popup.dart';
import 'package:todolist/presentation/components/todo.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final ThemeBloc themeBloc = ThemeBloc(ThemeRepositoryImpl(locator<Box<ThemeModel>>()));
  final TextEditingController text = TextEditingController();
  final LocalTodoRepositoryImpl repository = LocalTodoRepositoryImpl(locator.get<Box<LocalTodo>>());

  @override
  Widget build(BuildContext context) {
    TodoBloc bloc = TodoBloc(repository);
    final textColor = Theme.of(context).textTheme.displayLarge!.color;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: MyAppBar(
          title: "Todo List", 
        ),
      ),
      body: BlocProvider(
        create: (context) => bloc..add(const GetAllTodos()),
        child: BlocConsumer<TodoBloc, TodoState>(
          listener: (context, state) => {},
          builder: (BuildContext context, TodoState state) {
            if (state is TodoInitial) {
              return buildInitial(context, context.read<TodoBloc>());
            } else if (state is TodoLoading) {
              return buildLoading();
            } else if (state is TodosLoaded) {
              return buildLoaded(context, state.todos, context.read<TodoBloc>());
            }
            return Container();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: textColor,  
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Popup(text: text, bloc: bloc, flag: "todo");
            }
          );
        }
      ),
    );
  }

  Widget buildInitial(BuildContext context, TodoBloc bloc) {
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

  Widget buildLoaded(BuildContext context, List<LocalTodo> todos, TodoBloc bloc) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              return TodoComponent(
                title: todos[index].title, 
                date: todos[index].createdAt, 
                lists: todos[index].lists.length,
              );
            }
          ),
        ),
      ]),
    );
  }
}