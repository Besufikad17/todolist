import 'package:flutter/material.dart';
import 'package:todolist/config/router/args.dart';
import 'package:todolist/utils/resources/colors.dart';

void main() => runApp(const MyCard(title: '',));

class MyCard extends StatelessWidget {
  final String title;

  const MyCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(
          context,
          '/todo',
          arguments: TodoPageArgs(
            title
          ),
        )
      },
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        width: 300,
        height: 60,
        padding: const EdgeInsets.all(4),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: getColorFromHex("#000000"),
            ),
          borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
          ),
          child: Container(
            padding: const EdgeInsets.all(6),
            child: Text(title),
          )
        ),
        ),
      );
  }
}