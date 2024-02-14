import 'package:flutter/material.dart';
import 'package:todolist/data/datasource/local/local_list_service.dart';
import 'package:todolist/data/datasource/local/local_todo_service.dart';
import 'package:todolist/presentation/bloc/todo_bloc.dart';
import 'package:todolist/presentation/components/button.dart';
import 'package:todolist/presentation/components/text.dart';
import 'package:todolist/presentation/components/text_field.dart';
import 'package:todolist/utils/constants/enums.dart';
import 'package:todolist/utils/resources/colors.dart';
import 'package:todolist/utils/resources/widget.dart';

class AddPopup extends StatelessWidget {
  const AddPopup({
    super.key,
    required this.text,
    required this.bloc,
    required this.flag,
    this.todoTitle
  });

  final TodoBloc bloc;
  final TextEditingController text;
  final String flag;
  final String? todoTitle;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
            BoxShadow(
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 8
          ),
          child: Column(
            children: [
              SizedBox(
                width: 300, 
                height: 40, 
                child: MyTextField(controller: text, hintText: "Add $flag..",)
              ),
              const SizedBox(height: 20,),
              MyButton(
                text: "Add", 
                width: 300, 
                height: 40, 
                fontSize: 13,
                borderRadius: 15, 
                onPressed: () {
                  if(flag == "todo") {
                    bloc.add(AddTodo(LocalTodo(title: text.text, lists: [], status: TodoStatus.pending, createdAt: DateTime.now())));
                    bloc.add(const GetAllTodos());
                  }else {
                    bloc.add(AddList(LocalList(title: text.text, status: ListStatus.pending), todoTitle!));
                  }
                  Navigator.pop(context);
                }
              )
          ]),
        ),
      ),
    );
  }
}

class PromptPopup extends StatelessWidget {
  const PromptPopup({
    super.key, 
    required this.type, 
    required this.bloc,
    required this.todo
  });

  final ActionType type;
  final TodoBloc bloc;
  final LocalTodo todo;

  @override
  Widget build(BuildContext context) {
    final textColor = toHex(Theme.of(context).textTheme.displayLarge!.color!);
    final primaryColor = toHex(Theme.of(context).colorScheme.primary);
    String action = type == ActionType.archive && todo.status == TodoStatus.pending ?
      "archive" : type == ActionType.archive && todo.status == TodoStatus.archived ?
      "unarchive" : "delete";

    return Dialog(
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
            BoxShadow(
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                text: "Are you sure you want to \n $action this todo?", 
                size: 15,
                isBold: true,
                color: textColor.replaceAll(RegExp(r'f'), ''),
              ),
              const SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                    text: "Yes", 
                    width: 80, 
                    height: 20, 
                    fontSize: 15, 
                    borderRadius: 5,
                    fgcolor: textColor.replaceAll(RegExp(r'f'), ''),
                    bgcolor: primaryColor.replaceAll(RegExp(r'f'), ''),
                    onPressed: (){
                      if(type == ActionType.archive && todo.status == TodoStatus.pending) {
                        bloc.add(UpdateTodoStatus(todo, TodoStatus.archived));
                      }else if(type == ActionType.archive && todo.status == TodoStatus.archived) {
                        bloc.add(UpdateTodoStatus(todo, TodoStatus.pending));
                      }else if(type == ActionType.delete) {

                      }
                      Navigator.pop(context);
                    }, 
                  ),
                  MyButton(
                    text: "No", 
                    width: 80, 
                    height: 20, 
                    fontSize: 15, 
                    borderRadius: 5,
                    fgcolor: textColor.replaceAll(RegExp(r'f'), ''),
                    bgcolor: primaryColor,
                    onPressed: (){
                      Navigator.pop(context);
                    }, 
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}

class AlertPopup extends StatelessWidget {
  const AlertPopup({super.key, required this.title, required this.body, required this.type});

  final String title;
  final AlertType type;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: type == AlertType.message ? 
        MyText(text: title, size: 15,) :
        Text(title, style: const TextStyle(color: Colors.red)),
      content: body,
    );
  }
}

class ThemeSelectorPopup extends StatelessWidget {
  const ThemeSelectorPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(2)),
          color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
            BoxShadow(
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              MyText(text: "Themes", size: 15,),
              const SizedBox(height: 10,),
              buildThemeList(context)
            ]
          ),
        ),
      ),
    );
  }
}