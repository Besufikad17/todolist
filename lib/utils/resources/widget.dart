import 'package:flutter/material.dart';
import 'package:todolist/config/theme/themes.dart';
import 'package:todolist/data/datasource/local/local_todo_service.dart';
import 'package:todolist/data/datasource/local/theme_service.dart';
import 'package:todolist/locator.dart';
import 'package:todolist/presentation/bloc/theme_bloc.dart';
import 'package:todolist/presentation/bloc/todo_bloc.dart';
import 'package:todolist/presentation/components/text.dart';
import 'package:todolist/presentation/components/todo.dart';
import 'package:todolist/utils/resources/colors.dart';

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

  Widget buildThemeList(BuildContext context) {
    List<Widget> themes = [];

    for(int i = 0; i < MyAppTheme.values.length; i++) {
      final itemAppTheme = MyAppTheme.values[i];
      themes.add(
        Container(
          color: appThemeData[itemAppTheme]!.scaffoldBackgroundColor,
          height: 50,
          width: 300,
          child: GestureDetector(
            onTap: () {
              locator.get<ThemeBloc>().add(ThemeChanged(itemAppTheme));
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: itemAppTheme.toString().split(".")[1],
                    size: 18,
                    color: "#${toHex(appThemeData[itemAppTheme]!.colorScheme.onPrimary).substring(3)}"
                  ),
                ],
              ),
            ),
          ),
        )
      );
    }

    return Column(children: themes,);
  }