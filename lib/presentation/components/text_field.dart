import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
        fontSize: 15,
        color: Theme.of(context).textTheme.displayLarge!.color!
      ),
      decoration: InputDecoration(  
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).textTheme.displayLarge!.color!,
            width: 0
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15))
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).textTheme.displayLarge!.color!,
            width: 0
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15))
        ), 
        hintText: 'Add Todo..',  
        hintStyle: TextStyle(
          fontSize: 15,
          color: Theme.of(context).textTheme.displayLarge!.color!
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondary,
        contentPadding: const EdgeInsets.all(8)
      ), 
    );
  }
}