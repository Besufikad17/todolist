import 'package:hive/hive.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/utils/utils.dart';

class TodoRepository {

  final Box<Todo> _todoBox = Hive.box('todos');

  void addTodo (Todo todo) {
    _todoBox.add(todo);
  }

  List<Todo> getTodos () {
    return _todoBox.values.toList();
  }

  Todo? getTodoByTitle (String title) {
    for (var key in _todoBox.keys) {
      if((_todoBox.get(key) as Todo).title == title){
        return _todoBox.get(key);
      }
    }
    return null;
  }
}