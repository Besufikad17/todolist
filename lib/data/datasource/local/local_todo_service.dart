import 'package:hive/hive.dart';
import 'package:todolist/data/datasource/local/local_list_service.dart';

part 'local_todo_service.g.dart';

@HiveType(typeId: 0)
enum TodoStatus {
  @HiveField(0)
  pending,

  @HiveField(1)
  archived
}

@HiveType(typeId: 1)
class LocalTodo extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final List<LocalList> lists;

  @HiveField(3)
  TodoStatus? status;

  @HiveField(2)
  final DateTime createdAt;

  LocalTodo({
    required this.title,
    required this.lists,
    this.status,
    required this.createdAt,
  });

  void setStatus(TodoStatus status) {
    this.status = status;
  }
}