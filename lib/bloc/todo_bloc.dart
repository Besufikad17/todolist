import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todolist/models/lists.dart';
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
        final todo = _repository.getTodoByTitle(event.title);
        emit(TodoLoaded(todo));
     });

     on<AddTodo>((event, emit) async {
        _repository.addTodo(event.todolist);
        emit(TodosLoaded(_repository.getTodos()));
     });

     on<AddList>((event, emit) async {
        emit( const TodoLoading());
        _repository.addList(event.list, event.title);
        final todo = _repository.getTodoByTitle(event.title);
        emit(TodoLoaded(todo));
     });

     on<UpdateListStatus>((event, emit) async {
      emit( const TodoLoading());
      _repository.UpdateListStatus(event.status, event.listTitle, event.todoTitle);
      final todo = _repository.getTodoByTitle(event.todoTitle);
      emit(TodoLoaded(todo));
     });
  }
}
