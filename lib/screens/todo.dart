import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  final String title;
  const Todo({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(title),
        ),
      ),
    );
  }
}