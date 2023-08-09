import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:todolist/models/lists.dart';

part 'todo.g.dart';

@HiveType(typeId: 1)
class Todo extends Equatable {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final List<Lists> lists;
  
  @HiveField(2)
  final DateTime createdAt;

  Todo({
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