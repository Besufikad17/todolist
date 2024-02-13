import 'package:todolist/data/datasource/local/local_list_service.dart';
import 'package:todolist/data/datasource/local/local_todo_service.dart';

abstract class LocalTodoRepository {
  Future<void> addTodo(LocalTodo todo);

  Future<void> updateTodoStatus(LocalTodo todo, TodoStatus status);

  Future<List<LocalTodo>> getTodos(TodoStatus status);

  Future<LocalTodo> getTodoByTitle(TodoStatus status, String title);

  Future<void> deleteTodo(LocalTodo todo);

  Future<void> addList(LocalList list, String title);

  Future<void> updateListStatus(ListStatus status, String listTitle, String todoTitle);

  Future<void> updateList(LocalTodo todo);

  Future<void> deleteList(LocalTodo todo);
}