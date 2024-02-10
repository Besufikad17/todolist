import 'package:flutter/material.dart';
import 'package:todolist/presentation/bloc/todo_bloc.dart';
import 'package:todolist/presentation/components/button.dart';
import 'package:todolist/domain/models/lists.dart';
import 'package:todolist/domain/models/todo.dart';

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
    return AlertDialog(
      title: const Text("Add Todo"),
      content: Column(
        children: [
          TextField(
            controller: text,
            decoration: const InputDecoration(  
              border: OutlineInputBorder(),  
              labelText: 'Todo',  
              hintText: 'Add Todo..',  
            ), 
          ),
          const SizedBox(height: 20,),
          MyButton(
            text: "Add", 
            width: 250, 
            height: 40, 
            fontSize: 13, 
            onPressed: () => {
              if(flag == "todo") {
                bloc.add(AddTodo(Todo(title: text.text, lists: [], createdAt: DateTime.now()))),
                bloc.add(const GetAllTodos())
              }else {
                bloc.add(AddList(Lists(title: text.text, status: Status.pending), todoTitle!)),
              }
            }
          )
      ]),
    );
  }
}