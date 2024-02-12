import 'package:flutter/material.dart';
import 'package:todolist/data/datasource/local/local_list_service.dart';
import 'package:todolist/data/datasource/local/local_todo_service.dart';
import 'package:todolist/presentation/bloc/todo_bloc.dart';
import 'package:todolist/presentation/components/button.dart';
import 'package:todolist/presentation/components/text.dart';
import 'package:todolist/presentation/components/text_field.dart';
import 'package:todolist/utils/constants/enums.dart';
import 'package:todolist/utils/resources/colors.dart';

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
                child: MyTextField(controller: text, flag: flag,)
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
                    bloc.add(AddTodo(LocalTodo(title: text.text, lists: [], createdAt: DateTime.now())));
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
  const PromptPopup({super.key, required this.type});

  final ActionType type;

  @override
  Widget build(BuildContext context) {
    final textColor = toHex(Theme.of(context).textTheme.displayLarge!.color!);
    final primaryColor = toHex(Theme.of(context).colorScheme.primary);

    return Dialog(
      child: Container(
        height: 150,
        decoration: BoxDecoration(
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
                text: "Are you sure you want to \n ${type.name} this todo?", 
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