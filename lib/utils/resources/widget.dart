import 'package:flutter/material.dart';

Widget buildLoading(BuildContext context) {
  final textColor = Theme.of(context).textTheme.displayLarge!.color;

  return Center(
    child: CircularProgressIndicator(
      color: textColor,
    ),
  );
}
