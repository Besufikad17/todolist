import 'package:flutter/material.dart';
import 'package:todolist/data/datasource/local/theme_service.dart';
import 'package:todolist/utils/resources/colors.dart';

Color _iconColor = getColorFromHex("#458588");
Color _lightPrimaryColor = getColorFromHex("#458588");
Color _lightPrimaryVariantColor = getColorFromHex("#fbf1c7");
Color _lightSecondaryColor = getColorFromHex("#f9f5d7");
Color _lightOnPrimaryColor = getColorFromHex("#ebdbb2");
Color _darkPrimaryColor = getColorFromHex("#458588");
Color _darkPrimaryVariantColor = getColorFromHex("#282828");
Color _darkSecondaryColor = getColorFromHex("#3c3836s");
Color _darkOnPrimaryColor = getColorFromHex("#ebdbb2");

final TextTheme _lightTextTheme = TextTheme(
  displayLarge: _lightScreenHeading1TextStyle,
);
final TextTheme _darkTextTheme = TextTheme(
  displayLarge: _darkScreenHeading1TextStyle,
);
final TextStyle _lightScreenHeading1TextStyle = TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.bold,
    color: _lightOnPrimaryColor,
    fontFamily: "Iosevka Nerd Font");
final TextStyle _darkScreenHeading1TextStyle =
    _lightScreenHeading1TextStyle.copyWith(color: _darkOnPrimaryColor);

final appThemeData = {
  MyAppTheme.lightGruvBox: ThemeData(
      scaffoldBackgroundColor: _lightPrimaryVariantColor,
      appBarTheme: AppBarTheme(
        color: _lightPrimaryColor,
        iconTheme: IconThemeData(color: _lightOnPrimaryColor),
      ),
      colorScheme: ColorScheme.light(
          primary: _lightPrimaryColor,
          secondary: _lightSecondaryColor,
          onPrimary: _lightOnPrimaryColor,
          background: _lightOnPrimaryColor),
      iconTheme: IconThemeData(color: _iconColor),
      textTheme: _lightTextTheme,
      buttonTheme: ButtonThemeData(buttonColor: _iconColor)
      ),
  MyAppTheme.darkGruvBox: ThemeData(
      scaffoldBackgroundColor: _darkPrimaryVariantColor,
      appBarTheme: AppBarTheme(
        color: _darkPrimaryColor,
        iconTheme: IconThemeData(color: _darkOnPrimaryColor),
      ),
      colorScheme: ColorScheme.light(
          primary: _darkPrimaryColor,
          secondary: _darkSecondaryColor,
          onPrimary: _darkOnPrimaryColor,
          background: _darkOnPrimaryColor),
      iconTheme: IconThemeData(color: _iconColor),
      textTheme: _darkTextTheme,
      buttonTheme: ButtonThemeData(buttonColor: _iconColor)
      )
};
