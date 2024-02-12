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
    required this.lists,
    this.onlyBottom = true
  });

  final String title;
  final DateTime date;
  final int lists;
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
      child: SizedBox(
        height: 50,
        width: width < 600 ? width: 500,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: title, 
                            size: 15,
                            color: textColor
                          ),
                          const SizedBox(height: 10,),
                          MyText(
                            text: formatDate(date), 
                            size: 12,
                            color: primaryColor.replaceAll(RegExp(r'f'), ''),
                            isLight: true,
                          ),
                        ],
                      ),
                      MyText(
                        text: lists.toString(), 
                        size: 15, 
                        color: textColor,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}