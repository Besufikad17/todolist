import 'dart:math';

import 'package:todolist/data/datasource/local/theme_service.dart';
import 'package:todolist/utils/constants/strings.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

MyAppTheme getAppThemeFromName(String name) {
  if(name == "lightGruvBox") {
    return MyAppTheme.lightGruvBox;
  }else {
    return MyAppTheme.darkGruvBox;
  }
}

String formatDate(DateTime date) {
  return "${months[date.month - 1]} ${date.day}, ${date.year}";
}