import 'package:flutter/material.dart';
import 'package:todolist/data/datasource/local/local_list_service.dart';
import 'package:todolist/data/datasource/local/local_todo_service.dart';
import 'package:todolist/presentation/bloc/todo_bloc.dart';
import 'package:todolist/presentation/components/button.dart';
import 'package:todolist/presentation/components/text_field.dart';

class Popup extends StatelessWidget {
  const Popup({
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
                child: MyTextField(controller: text)
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