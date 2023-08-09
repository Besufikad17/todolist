part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class GetTodo extends TodoEvent {
  const GetTodo();

  @override
  List<Object?> get props => [];
}

class AddTodo extends TodoEvent {
  final Todo todolist;

  const AddTodo({
    required this.todolist
  });
  
  @override
  List<Object?> get props => [todolist];
}
