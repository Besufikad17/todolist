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
    final index = _todoBox.values.toList().indexOf(todoToEdit);
    List<LocalList> lists = todoToEdit.lists;
    lists.add(list);
    await _todoBox.put(index, LocalTodo(title: todoToEdit.title, lists: lists, createdAt: todoToEdit.createdAt));
  }

  Future<void> updateListStatus(ListStatus status, String listTitle, String todoTitle) async {
    final todoToEdit = _todoBox.values.firstWhere((todo) => todo.title == todoTitle);
    final index = _todoBox.values.toList().indexOf(todoToEdit);
    List<LocalList> lists = todoToEdit.lists;
    for(var list in lists) {
      if(list.title == listTitle) {
        lists.remove(list);
        lists.add(LocalList(title: listTitle, status: status));
      }
    }
    await _todoBox.put(index, LocalTodo(title: todoToEdit.title, lists: lists, createdAt: todoToEdit.createdAt));
  }

  @override
  Future<List<LocalTodo>> getTodos() async {
    return _todoBox.values.toList();
  }

  @override
  Future<LocalTodo> getTodoByTitle (String title) async {
    return _todoBox.values.where((todo) => todo.title == title).first;
  }
}