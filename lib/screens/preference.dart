import 'package:flutter/material.dart';
import 'package:todolist/global/theme/themes.dart';

class PreferencePage extends StatelessWidget {
  const PreferencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preference"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: AppTheme.values.length,
        itemBuilder: (context, index) {
          final itemAppTheme = AppTheme.values[index];
          return Card(
            color: appThemeData[itemAppTheme]!.scaffoldBackgroundColor,
            child: ListTile(
              title: Text(
                itemAppTheme.toString().split(".")[1],
                style: TextStyle(color: appThemeData[itemAppTheme]!.colorScheme.onPrimary),
              ),
              onTap: () {
              },
            ),
          );
        },
      ),
    );
  }
}