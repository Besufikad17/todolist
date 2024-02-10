import 'package:flutter/material.dart';
import 'package:todolist/presentation/bloc/theme_bloc.dart';
import 'package:todolist/presentation/components/app_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.themeBloc});

  final ThemeBloc themeBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: MyAppBar(
          title: "Todo List", 
          themeBloc: themeBloc
        ),
      ),
    );
  }
}