import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:todolist/config/router/args.dart';
import 'package:todolist/data/datasource/local/local_todo_service.dart';
import 'package:todolist/presentation/bloc/todo_bloc.dart';
import 'package:todolist/presentation/components/popup.dart';
import 'package:todolist/presentation/components/text.dart';
import 'package:todolist/utils/constants/enums.dart';
import 'package:todolist/utils/resources/colors.dart';
import 'package:todolist/utils/resources/data.dart';

class TodoComponent extends StatelessWidget {
  const TodoComponent({
    super.key,
    required this.todo,
    required this.bloc
  });

  final TodoBloc bloc;
  final LocalTodo todo;
  
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
            todo.title
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
              return PromptPopup(type: ActionType.archive, todo: todo, bloc: bloc,);
            }
          );
        },
        onLeftSwipe: (details) {
          showDialog(
            context: context, 
            builder: (BuildContext context) {
              return PromptPopup(type: ActionType.delete, todo: todo, bloc: bloc,);
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
                              text: todo.title, 
                              size: 15,
                              color: textColor.replaceAll(RegExp(r'f'), '')
                            ),
                            const SizedBox(height: 10,),
                            MyText(
                              text: formatDate(todo.createdAt), 
                              size: 12,
                              color: primaryColor.replaceAll(RegExp(r'f'), ''),
                              isLight: true,
                            ),
                          ],
                        ),
                        MyText(
                          text: todo.lists.length.toString(), 
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


