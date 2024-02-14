import 'package:todolist/data/datasource/local/local_todo_service.dart';

class TodoPageArgs {
  final String title;
  final TodoStatus status;

  const TodoPageArgs(this.title, this.status);
}