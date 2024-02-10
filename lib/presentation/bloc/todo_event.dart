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
  final String title;

  const GetTodo(this.title);

  @override
  List<Object?> get props => [title];
}

class AddTodo extends TodoEvent {
  final Todo todolist;

  const AddTodo(this.todolist);
  
  @override
  List<Object?> get props => [todolist];
}

class AddList extends TodoEvent {
  final Lists list;
  final String title;

  const AddList(this.list, this.title);
  
  @override
  List<Object?> get props => [list];
}

class UpdateListStatus extends TodoEvent {
  final Status status;
  final String listTitle;
  final String todoTitle;

  const UpdateListStatus(this.status, this.listTitle, this.todoTitle);
  
  @override
  List<Object?> get props => [status, listTitle, todoTitle];
}
