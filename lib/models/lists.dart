import 'package:equatable/equatable.dart';

enum Status {
  pending,
  completed
}

class Lists extends Equatable {
  final String title;
  final Status status;

  Lists({
    required this.title,
    required this.status
  });
  
  @override
  List<Object?> get props => [title, status];
}