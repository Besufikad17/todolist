part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class InitEvent extends TodoEvent {
  const InitEvent();

  @override
  List<Object?> get props => [];
}

class GetAllTodos extends TodoEvent {
  const GetAllTodos();
  
  @override
  List<Object?> get props => [];
}

class GetTodo extends TodoEvent {
  final String id;

  const GetTodo(this.id);

  @override
  List<Object?> get props => [id];
}

class AddTodo extends TodoEvent {
  final Todo todolist;

  const AddTodo({
    required this.todolist
  });
  
  @override
  List<Object?> get props => [todolist];
}
