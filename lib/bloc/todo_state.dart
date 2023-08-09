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

class TodoLoaded extends TodoState {
  final Map<String, dynamic> todo;
  const TodoLoaded(this.todo);
  @override
  List<Object> get props => [Todo];
}

class TodoError extends TodoState {
  final String message;
  const TodoError(this.message);
  @override
  List<Object> get props => [message];
}

