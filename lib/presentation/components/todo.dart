import 'package:flutter/material.dart';
import 'package:todolist/config/router/args.dart';
import 'package:todolist/presentation/components/text.dart';
import 'package:todolist/utils/resources/colors.dart';
import 'package:todolist/utils/resources/data.dart';

class TodoComponent extends StatelessWidget {
  const TodoComponent({
    super.key,
    required this.title,
    required this.date,
    this.onlyBottom = true
  });

  final String title;
  final DateTime date;
  final bool onlyBottom;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final textColor = toHex(Theme.of(context).textTheme.displayLarge!.color!);
    final primaryColor = toHex(Theme.of(context).colorScheme.primary);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/todo',
          arguments: TodoPageArgs(
            title
          ),
        );
      },
      child: Container(
        height: 50,
        width: width < 600 ? width: 500,
        decoration: BoxDecoration(
          border: onlyBottom ?
          Border(
            bottom:  BorderSide(
              color: getColorFromHex("#B4B4B4"),
              width: 1,
              style: BorderStyle.solid
            )
          ) : Border(
            bottom:  BorderSide(
              color: getColorFromHex("#B4B4B4"),
              width: 1,
              style: BorderStyle.solid
            ),
            top:  BorderSide(
              color: getColorFromHex("#B4B4B4"),
              width: 1,
              style: BorderStyle.solid
            )
          )
        ),
        child: SizedBox(
          width: width,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  width: width - 10,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        MyText(
                          text: title, 
                          size: 15,
                          color: textColor
                        ),
                        MyText(
                          text: formatDate(date), 
                          size: 15,
                          color: primaryColor.replaceAll(RegExp(r'f'), ''),
                          isLight: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}