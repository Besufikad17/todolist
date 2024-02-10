import 'package:todolist/presentation/bloc/theme_bloc.dart';

class HomePageArguments {
  final String title;
  final ThemeBloc themeBloc;

  const HomePageArguments(this.title, this.themeBloc);
}