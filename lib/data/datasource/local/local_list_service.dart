import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'local_list_service.g.dart';

@HiveType(typeId: 3)
enum ListStatus {
  @HiveField(0)
  pending,

  @HiveField(1)
  completed
}

@HiveType(typeId: 2)
class LocalList extends Equatable {
  
  @HiveField(0)
  final String title;
  
  @HiveField(1)
  final ListStatus status;

  const LocalList({
    required this.title,
    required this.status
  });
  
  @override
  List<Object?> get props => [title, status];
}