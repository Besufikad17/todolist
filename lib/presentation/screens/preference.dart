import 'package:flutter/material.dart';
import 'package:todolist/data/datasource/local/theme_service.dart';
import 'package:todolist/locator.dart';
import 'package:todolist/presentation/bloc/theme_bloc.dart';
import 'package:todolist/config/theme/themes.dart';

class PreferencePage extends StatelessWidget {
  PreferencePage({super.key});
  final ThemeBloc bloc = locator.get<ThemeBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preference"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10,),
          const Text("Themes"),
          Expanded(
            child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: MyAppTheme.values.length,
            itemBuilder: (context, index) {
              final itemAppTheme = MyAppTheme.values[index];
              return Card(
                color: appThemeData[itemAppTheme]!.scaffoldBackgroundColor,
                child: ListTile(
                  title: Text(
                    itemAppTheme.toString().split(".")[1],
                    style: TextStyle(color: appThemeData[itemAppTheme]!.colorScheme.onPrimary),
                  ),
                  onTap: () {
                    print("change theme");
                    bloc.add(ThemeChanged(itemAppTheme));
                  },
                ),
              );
            },
                  ),
          ),
        ]
      ),
    );
  }
}