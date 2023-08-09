import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'lists.g.dart';

@HiveType(typeId: 3)
enum Status {
  @HiveField(0)
  pending,

  @HiveField(1)
  completed
}

@HiveType(typeId: 2)
class Lists extends Equatable {
  
  @HiveField(0)
  final String title;
  
  @HiveField(1)
  final Status status;

  Lists({
    required this.title,
    required this.status
  });
  
  @override
  List<Object?> get props => [title, status];
}