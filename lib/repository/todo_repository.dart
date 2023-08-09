import 'package:hive/hive.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/utils/utils.dart';

class TodoRepository {

  final todoBox = Hive.box('todo');

  Map<String, dynamic> addTodo (Todo todo) {
    String id = getRandomString(4);
    todoBox.put(id,todo);
    todoBox.close();
    return {
      "id": id,
      "todo": todoBox.get(id)
    };
  }

  List<Map<String, Todo>> getTodos () {
    List<Map<String, Todo>> todos = [];
    for (var key in todoBox.keys) {
      todos.add({
        "id": key,
        "todo": todoBox.get(key)
      });
    }
    todoBox.close();
    return todos;
  }

  Todo getTodoById (String id) { 
    return todoBox.get(id);
  }

  Todo? getTodoByTitle (String title) {
    for (var key in todoBox.keys) {
      if((todoBox.get(key) as Todo).title == title){
        return todoBox.get(key);
      }
    }
    return null;
  }
}