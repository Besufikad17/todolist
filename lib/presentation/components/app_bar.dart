import 'package:flutter/material.dart';
import 'package:todolist/presentation/bloc/theme_bloc.dart';
import 'package:todolist/presentation/screens/preference.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key, required this.title, required this.themeBloc});
  
  final ThemeBloc themeBloc;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(title, style: Theme.of(context).textTheme.displayLarge),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PreferencePage(bloc: themeBloc),
            ));
          },
        )
      ]);
  }
}