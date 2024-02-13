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

class GetArchivedTodos extends TodoEvent {
  const GetArchivedTodos();

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
  final LocalTodo todolist;

  const AddTodo(this.todolist);
  
  @override
  List<Object?> get props => [todolist];
}

class AddList extends TodoEvent {
  final LocalList list;
  final String title;

  const AddList(this.list, this.title);
  
  @override
  List<Object?> get props => [list];
}

class UpdateListStatus extends TodoEvent {
  final ListStatus status;
  final String listTitle;
  final String todoTitle;

  const UpdateListStatus(this.status, this.listTitle, this.todoTitle);
  
  @override
  List<Object?> get props => [status, listTitle, todoTitle];
}

class UpdateTodoStatus extends TodoEvent {
  final LocalTodo todo;
  final TodoStatus status;

  const UpdateTodoStatus(this.todo, this.status);

  @override
  List<Object?> get props => [todo, status];
}