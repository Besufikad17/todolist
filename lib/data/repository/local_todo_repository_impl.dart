import 'package:hive/hive.dart';
import 'package:todolist/data/datasource/local/local_list_service.dart';
import 'package:todolist/data/datasource/local/local_todo_service.dart';
import 'package:todolist/domain/repository/local_todo_repository.dart';

class LocalTodoRepositoryImpl implements LocalTodoRepository {
  final Box<LocalTodo> _todoBox;

  const LocalTodoRepositoryImpl(this._todoBox);

  @override
  Future<void> addTodo(LocalTodo todo) async {
    await _todoBox.add(todo);
  }

  @override
  Future<void> addList(LocalList list, String title) async {
    final todoToEdit = _todoBox.values.firstWhere((todo) => todo.title == title);
    List<LocalList> lists = todoToEdit.lists;
    lists.add(list);
    todoToEdit.save();
  }

  @override
  Future<void> updateListStatus(ListStatus status, String listTitle, String todoTitle) async {
    final todoToEdit = _todoBox.values.firstWhere((todo) => todo.title == todoTitle);
    List<LocalList> lists = todoToEdit.lists;
    for(var list in lists) {
      if(list.title == listTitle) {
        lists.remove(list);
        lists.add(LocalList(title: listTitle, status: status));
      }
    }
    todoToEdit.save();
  }

  @override
  Future<List<LocalTodo>> getTodos(TodoStatus status) async {
    return _todoBox.values.where((todo) => todo.status == status).toList();
  }

  @override
  Future<LocalTodo> getTodoByTitle (TodoStatus status, String title) async {
    return _todoBox.values.where((todo) => todo.title == title && todo.status == status).first;
  }
  
  @override
  Future<void> updateTodoStatus(LocalTodo todo, TodoStatus status) async {
    todo.status = status;
    todo.save();
  }
  
  @override
  Future<void> deleteList(LocalTodo todo) {
    // TODO: implement deleteList
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteTodo(LocalTodo todo) async {
    todo.delete();
  }
  
  @override
  Future<void> updateList(LocalTodo todo) {
    // TODO: implement updateList
    throw UnimplementedError();
  }
}