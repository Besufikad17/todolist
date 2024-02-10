import 'package:flutter/material.dart';
import 'package:todolist/presentation/components/text.dart';
import 'package:todolist/utils/resources/colors.dart';
import 'package:todolist/utils/constants/enums.dart';

class TodoComponent extends StatelessWidget {
  const TodoComponent({
    super.key,
    required this.title,
    required this.status,
    required this.dueDate,
    this.onlyBottom = true
  });

  final String title;
  final TodoStatus status;
  final DateTime dueDate;
  final bool onlyBottom;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
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
        child: Row(
          children: [
            Column(
              children: [
                SizedBox(
                  width: width - 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      MyText(
                        text: title, 
                        size: 15,
                        color: "#000000",
                      ),
                      MyText(
                        text: dueDate.toString(), 
                        size: 15,
                        color: "#000000",
                        isBold: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: width - 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      MyText(
                        text: status.name.toUpperCase(), 
                        size: 12,
                        color: "#6a6a6a",
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}