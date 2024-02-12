import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:todolist/config/router/args.dart';
import 'package:todolist/presentation/components/popup.dart';
import 'package:todolist/presentation/components/text.dart';
import 'package:todolist/utils/constants/enums.dart';
import 'package:todolist/utils/resources/colors.dart';
import 'package:todolist/utils/resources/data.dart';

class TodoComponent extends StatelessWidget {
  const TodoComponent({
    super.key,
    required this.title,
    required this.date,
    required this.lists,
  });

  final String title;
  final DateTime date;
  final int lists;
  
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
      child: SwipeTo(
        iconColor: getColorFromHex(textColor),
        iconOnLeftSwipe: Icons.delete,
        iconOnRightSwipe: Icons.archive,
        onRightSwipe: (details) {
          showDialog(
            context: context, 
            builder: (BuildContext context) {
              return const PromptPopup(type: ActionType.archive);
            }
          );
        },
        onLeftSwipe: (details) {
          showDialog(
            context: context, 
            builder: (BuildContext context) {
              return const PromptPopup(type: ActionType.delete);
            }
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
                              color: textColor.replaceAll(RegExp(r'f'), '')
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
                          color: textColor.replaceAll(RegExp(r'f'), ''),
                        )
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

