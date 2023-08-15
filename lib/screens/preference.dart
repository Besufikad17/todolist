import 'package:flutter/material.dart';
import 'package:todolist/bloc/theme_bloc.dart';
import 'package:todolist/global/theme/themes.dart';
import 'package:todolist/models/theme.dart';

class PreferencePage extends StatelessWidget {
  const PreferencePage({super.key, required this.bloc});
  final ThemeBloc bloc;

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