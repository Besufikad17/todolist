part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoInitial extends TodoState {
  const TodoInitial();
  
  @override
  List<Object?> get props => [];
}

class TodoLoading extends TodoState {
  const TodoLoading();
  @override
  List<Object> get props => [];
}

class TodosLoaded extends TodoState {
  final List<LocalTodo> todos;
  const TodosLoaded(this.todos);
  @override
  List<Object> get props => [todos];
}

class TodoLoaded extends TodoState {
  final LocalTodo todo;
  const TodoLoaded(this.todo);
  @override
  List<Object> get props => [LocalTodo];
}

class TodoError extends TodoState {
  final String message;
  const TodoError(this.message);
  @override
  List<Object> get props => [message];
}

