import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/bloc/todo_bloc.dart';
import 'package:todolist/components/button.dart';
import 'package:todolist/models/todo.dart';

class Popup extends StatelessWidget {
  const Popup({
    super.key,
    required this.text,
    required this.bloc
  });

  final TodoBloc bloc;
  final TextEditingController text;

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
            bgcolor: "#91d2ff", 
            borderRadius: 10, 
            fgcolor: "#000000", 
            fontSize: 13, 
            onPressed: () => {
              bloc.add(AddTodo(todolist: Todo(title: text.text, lists: [], createdAt: DateTime.now()))),
              bloc.add(const GetAllTodos())
            }
          )
      ]),
    );
  }
}