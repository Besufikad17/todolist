import 'package:hive/hive.dart';
import 'package:todolist/domain/models/lists.dart';
import 'package:todolist/domain/models/todo.dart';

class TodoRepository {

  final Box<Todo> _todoBox = Hive.box('todos');

  void addTodo (Todo todo) {
    _todoBox.add(todo);
  }

  void addList (Lists list, String title) async {
    final todoToEdit = _todoBox.values.firstWhere((todo) => todo.title == title);
    final index = _todoBox.values.toList().indexOf(todoToEdit);
    List<Lists> lists = todoToEdit.lists;
    lists.add(list);
    await _todoBox.put(index,Todo(title: todoToEdit.title, lists: lists, createdAt: todoToEdit.createdAt));
  }

  void UpdateListStatus (Status status, String listTitle, String todoTitle) async {
    final todoToEdit = _todoBox.values.firstWhere((todo) => todo.title == todoTitle);
    final index = _todoBox.values.toList().indexOf(todoToEdit);
    List<Lists> lists = todoToEdit.lists;
    for(var list in lists) {
      if(list.title == listTitle) {
        lists.remove(list);
        lists.add(Lists(title: listTitle, status: status));
      }
    }
    await _todoBox.put(index,Todo(title: todoToEdit.title, lists: lists, createdAt: todoToEdit.createdAt));
  }

  List<Todo> getTodos () {
    return _todoBox.values.toList();
  }

  Todo getTodoByTitle (String title) {
    return _todoBox.values.where((todo) => todo.title == title).first;
  }
}