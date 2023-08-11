import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/repository/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _repository;

  TodoBloc(this._repository) : super(const TodoInitial()) {
     on<GetAllTodos>((event, emit) async {
        emit(TodosLoaded(_repository.getTodos()));
     });

     on<GetTodo>((event, emit) async {
      //  TODO 
     });

     on<AddTodo>((event, emit) async {
        _repository.addTodo(event.todolist);
        emit(TodosLoaded(_repository.getTodos()));
     });
  }
}
