import 'package:flutter/material.dart';
import 'package:todolist/utils/colors.dart';

enum AppTheme {
  gruvBoxLight,
  gruvBoxDark
}

Color _iconColor = getColorFromHex("#458588");
Color _lightPrimaryColor = getColorFromHex("#fbf1c7");
Color _lightPrimaryVariantColor = getColorFromHex("#fbf1c7");
Color _lightSecondaryColor = getColorFromHex("#f9f5d7");
Color _lightOnPrimaryColor = getColorFromHex("#282828");
Color _darkPrimaryColor =  getColorFromHex("#282828");
Color _darkPrimaryVariantColor =  getColorFromHex("#282828");
Color _darkSecondaryColor =  getColorFromHex("#3c3836s");
Color _darkOnPrimaryColor =  getColorFromHex("#ebdbb2");

final appThemeData = {
  AppTheme.gruvBoxLight: ThemeData(
    scaffoldBackgroundColor: _lightPrimaryVariantColor,
    appBarTheme: AppBarTheme(
      color: _lightPrimaryColor,
      iconTheme: IconThemeData(color: _lightOnPrimaryColor),
    ),
    colorScheme: ColorScheme.light(
      primary:  _lightPrimaryColor,
      secondary: _lightSecondaryColor,
      onPrimary: _lightOnPrimaryColor,
      background: _lightOnPrimaryColor
    ),
    iconTheme:  IconThemeData(
      color: _iconColor
    )
  ),
  AppTheme.gruvBoxDark: ThemeData(
     scaffoldBackgroundColor: _darkPrimaryVariantColor,
    appBarTheme: AppBarTheme(
      color: _darkPrimaryColor,
      iconTheme: IconThemeData(color: _darkOnPrimaryColor),
    ),
    colorScheme: ColorScheme.light(
      primary:  _darkPrimaryColor,
      secondary: _darkSecondaryColor,
      onPrimary: _darkOnPrimaryColor,
      background: _darkOnPrimaryColor
    ),
    iconTheme:  IconThemeData(
      color: _iconColor
    )
  )
};