import 'package:equatable/equatable.dart';
import 'package:todolist/models/lists.dart';

class Todo extends Equatable {
  final String title;
  final List<Lists> lists;
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