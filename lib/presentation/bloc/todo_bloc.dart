import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todolist/data/datasource/local/local_list_service.dart';
import 'package:todolist/data/datasource/local/local_todo_service.dart';
import 'package:todolist/data/repository/local_todo_repository_impl.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final LocalTodoRepositoryImpl _repository;

  TodoBloc(this._repository) : super(const TodoInitial()) {
     on<GetAllTodos>((event, emit) async {
      emit(const TodoLoading());
      final result = await _repository.getTodos(TodoStatus.pending);
      emit(TodosLoaded(result));
     });

     on<GetArchivedTodos>((event, emit) async {
      emit(const TodoLoading());
      final result = await _repository.getTodos(TodoStatus.archived);
      emit(TodosLoaded(result));
     });

     on<GetTodo>((event, emit) async {
      emit(const TodoLoading());
      final todo = await _repository.getTodoByTitle(event.status, event.title);
      emit(TodoLoaded(todo));
     });

     on<AddTodo>((event, emit) async {
      emit(const TodoLoading());
      await _repository.addTodo(event.todolist);
      emit(const TodoAdded());
     });

     on<AddList>((event, emit) async {
      emit(const TodoLoading());
      await _repository.addList(event.list, event.title);
      final todo = await _repository.getTodoByTitle(TodoStatus.pending, event.title);
      emit(TodoLoaded(todo));
     });

     on<UpdateListStatus>((event, emit) async {
      emit(const TodoLoading());
      await _repository.updateListStatus(event.status, event.listTitle, event.todoTitle);
      final todo = await _repository.getTodoByTitle(TodoStatus.pending, event.todoTitle);
      emit(TodoLoaded(todo));
     });

     on<UpdateTodoStatus>((event, emit) async {
      emit(const TodoLoading());
      await _repository.updateTodoStatus(event.todo, event.status);
      emit(const TodoUpdated());
     });
  }
}
