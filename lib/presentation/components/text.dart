import 'package:todolist/utils/resources/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyText extends StatelessWidget {
  final String text;
  final double size;
  bool isBold;
  bool isUnderline;
  bool isLight;
  bool isObscure;
  double width;
  String? color;
  TextOverflow overflow;
  TextStyle? style;

  MyText({
    super.key,
    required this.text,
    required this.size,
    this.isBold = false,
    this.isUnderline = false,
    this.isLight = false,
    this.isObscure = true,
    this.width = 0,
    this.color,
    this.overflow = TextOverflow.ellipsis,
    this.style
  });

  FontWeight getFontWeight() {
    if(isBold) {
      return FontWeight.w600;
    }else if(isLight) {
      return FontWeight.w300;
    }else {
      return FontWeight.normal;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      isObscure == true ? text : text.replaceAll(RegExp(r"."), "*"),
      overflow: overflow,
      textDirection: TextDirection.ltr,
      style: style != null ?  
        style!.copyWith(
          decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
          fontWeight: getFontWeight(),
          color: color != null ? getColorFromHex(color!) :  Theme.of(context).colorScheme.onPrimary
        ) : 
        TextStyle(
          fontSize: size,
          decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
          fontWeight: getFontWeight(),
          color: color != null ? getColorFromHex(color!) :  Theme.of(context).colorScheme.onPrimary
        ),
      textAlign: TextAlign.center
    );
  }
}