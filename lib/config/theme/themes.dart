import 'package:flutter/material.dart';
import 'package:todolist/data/datasource/local/theme_service.dart';
import 'package:todolist/utils/resources/colors.dart';

// Normal colors

Color _iconColor = getColorFromHex("#466fc4");
Color _lightPrimaryColor = getColorFromHex("#466fc4");
Color _lightPrimaryVariantColor = getColorFromHex("#fcfcfc");
Color _lightSecondaryColor = getColorFromHex("#fcfcfc");
Color _lightOnPrimaryColor = getColorFromHex("#000000");
Color _darkPrimaryColor = getColorFromHex("#466fc4");
Color _darkPrimaryVariantColor = getColorFromHex("#000000");
Color _darkSecondaryColor = getColorFromHex("#1f1d1c");
Color _darkOnPrimaryColor = getColorFromHex("#f4f4f4");

// Gruvbox colors

Color _gruvBoxIconColor = getColorFromHex("#458588");
Color _gruvBoxLightPrimaryColor = getColorFromHex("#458588");
Color _gruvBoxLightPrimaryVariantColor = getColorFromHex("#fbf1c7");
Color _gruvBoxLightSecondaryColor = getColorFromHex("#f9f5d7");
Color _gruvBoxLightOnPrimaryColor = getColorFromHex("#282828");
Color _gruvBoxDarkPrimaryColor = getColorFromHex("#458588");
Color _gruvBoxDarkPrimaryVariantColor = getColorFromHex("#282828");
Color _gruvBoxDarkSecondaryColor = getColorFromHex("#3c3836s");
Color _gruvBoxDarkOnPrimaryColor = getColorFromHex("#ebdbb2");

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

final TextTheme _gruvBoxLightTextTheme = TextTheme(
  displayLarge: _gruvBoxLightScreenHeading1TextStyle,
);
final TextTheme _gruvBoxDarkTextTheme = TextTheme(
  displayLarge: _gruvBoxDarkScreenHeading1TextStyle,
);
final TextStyle _gruvBoxLightScreenHeading1TextStyle = TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.bold,
    color: _gruvBoxLightOnPrimaryColor,
    fontFamily: "Iosevka Nerd Font");
final TextStyle _gruvBoxDarkScreenHeading1TextStyle =
    _gruvBoxLightScreenHeading1TextStyle.copyWith(color: _gruvBoxDarkOnPrimaryColor);

final appThemeData = {
  MyAppTheme.light: ThemeData(
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
  MyAppTheme.dark: ThemeData(
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
  ),
  MyAppTheme.lightGruvBox: ThemeData(
      scaffoldBackgroundColor: _gruvBoxLightPrimaryVariantColor,
      appBarTheme: AppBarTheme(
        color: _gruvBoxLightPrimaryColor,
        iconTheme: IconThemeData(color: _gruvBoxLightOnPrimaryColor),
      ),
      colorScheme: ColorScheme.light(
          primary: _gruvBoxLightPrimaryColor,
          secondary: _gruvBoxLightSecondaryColor,
          onPrimary: _gruvBoxLightOnPrimaryColor,
          background: _gruvBoxLightOnPrimaryColor),
      iconTheme: IconThemeData(color: _gruvBoxIconColor),
      textTheme: _gruvBoxLightTextTheme,
      buttonTheme: ButtonThemeData(buttonColor: _gruvBoxIconColor)
      ),
  MyAppTheme.darkGruvBox: ThemeData(
      scaffoldBackgroundColor: _gruvBoxDarkPrimaryVariantColor,
      appBarTheme: AppBarTheme(
        color: _gruvBoxDarkPrimaryColor,
        iconTheme: IconThemeData(color: _gruvBoxDarkOnPrimaryColor),
      ),
      colorScheme: ColorScheme.light(
          primary: _gruvBoxDarkPrimaryColor,
          secondary: _gruvBoxDarkSecondaryColor,
          onPrimary: _gruvBoxDarkOnPrimaryColor,
          background: _gruvBoxDarkOnPrimaryColor),
      iconTheme: IconThemeData(color: _gruvBoxIconColor),
      textTheme: _gruvBoxDarkTextTheme,
      buttonTheme: ButtonThemeData(buttonColor: _gruvBoxIconColor)
      )
};
