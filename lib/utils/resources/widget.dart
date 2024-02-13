import 'package:flutter/material.dart';
import 'package:todolist/data/datasource/local/local_todo_service.dart';
import 'package:todolist/presentation/bloc/todo_bloc.dart';
import 'package:todolist/presentation/components/todo.dart';

Widget buildLoading(BuildContext context) {
  final textColor = Theme.of(context).textTheme.displayLarge!.color;

  return Center(
    child: CircularProgressIndicator(
      color: textColor,
    ),
  );
}

  Widget buildLoaded(BuildContext context, List<LocalTodo> todos, TodoBloc bloc) {
    List<Widget> todoComponents =  [];

    for(int i = 0; i < todos.length; i++) {
      todoComponents.add(
        TodoComponent(
          todo: todos[i],
          bloc: bloc,
        )
      );
    } 

    return Column(children: todoComponents);
  }