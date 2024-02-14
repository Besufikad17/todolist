import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todolist/config/router/routes.dart';
import 'package:todolist/data/datasource/local/theme_service.dart';
import 'package:todolist/data/repository/theme_repository_impl.dart';
import 'package:todolist/locator.dart';
import 'package:todolist/config/theme/themes.dart';
import 'package:todolist/presentation/bloc/theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependency();
  final currentTheme = await ThemeRepositoryImpl(locator<Box<ThemeModel>>()).getTheme();
  runApp(MyApp(currentTheme: currentTheme != null ? currentTheme.theme : MyAppTheme.lightGruvBox,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.currentTheme});

  final MyAppTheme currentTheme;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<ThemeBloc>()..add(const InitialTheme()),
      child: BlocConsumer<ThemeBloc, ThemeState>(
        listener:(context, state) {},
        builder: (context, state) {
          if(state is ThemeInitial) {
            return MaterialApp(
              title: 'TodoList',
              theme: appThemeData[currentTheme],
              routes: routes,
              initialRoute: '/',
            );
          }else if(state is ThemeLoaded) {
            return MaterialApp(
              title: 'TodoList',
              theme: appThemeData[state.loadedAppTheme],
              routes: routes,
              initialRoute: '/',
            );
          }else {
            return MaterialApp(
              title: 'TodoList',
              theme: appThemeData[MyAppTheme.light],
              routes: routes,
              initialRoute: '/',
            );
          }     
        },
      ),
    );
  }
}

