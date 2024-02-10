import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:todolist/data/datasource/local/local_list_service.dart';

part 'local_todo_service.g.dart';

@HiveType(typeId: 1)
class LocalTodo extends Equatable {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final List<LocalList> lists;
  
  @HiveField(2)
  final DateTime createdAt;

  const LocalTodo({
    required this.title,
    required this.lists,
    required this.createdAt,
  });
  
  @override
  List<Object?> get props => [
    title,
    lists,
    createdAt
  ];
}