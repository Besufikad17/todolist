import 'dart:math';

import 'package:todolist/data/datasource/local/theme_service.dart';

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