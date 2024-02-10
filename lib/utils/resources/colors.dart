import 'package:flutter/material.dart';

Color getColorFromHex(String hex) {
  return Color(int.parse(hex.substring(1, 7), radix: 16) + 0xFF000000);
}

String toHex(Color color) {
  return '#${(color.value.toRadixString(16))}';
}