import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/repository/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository repository;

  TodoBloc(this.repository) : super(const TodoInitial()) {
    Stream<TodoState> on (TodoEvent event) async* {
      if(event is GetTodo) {
        final todo = this.repository.getTodoById(event.id);
        yield TodoLoaded(todo);
      }else if(event is GetAllTodos) {

      }else if(event is AddTodo) {
        final todo = repository.addTodo(event.todolist);
        yield TodoLoaded(todo);
      }
    }
  }
}
