import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/repository/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository repository;

  TodoBloc(this.repository) : super(const TodoInitial()) {
    on<TodoEvent>((event, emit) {
      if(event is GetTodo) {

      }else if(event is AddTodo) {
        
      }
    });
  }
}
