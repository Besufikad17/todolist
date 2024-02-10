import 'package:todolist/data/datasource/local/local_list_service.dart';
import 'package:todolist/data/datasource/local/local_todo_service.dart';

abstract class LocalTodoRepository {
  Future<void> addTodo (LocalTodo todo);

  Future<void> addList (LocalList list, String title);

  Future<void> updateListStatus (ListStatus status, String listTitle, String todoTitle);

  Future<List<LocalTodo>> getTodos();

  Future<LocalTodo> getTodoByTitle (String title);
}