import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task  extends Equatable{
  final String id;
  final String title;
  String? description;
  bool? isDone;
  bool? isDeleted;

  Task({
    required this.title,
    required this.id,
    this.description,
    this.isDone,
    this.isDeleted,
  }){
    isDone= isDone ?? false;
    isDeleted = isDeleted ?? false;
  }
  Task copyWith({
    String? title,
    String? id,
    String? description,
    bool? isDone,
    bool? isDeleted,
    }){
      return Task(
        title: title ?? this.title,
        id: id ?? this.id,
        description: description ?? this.description,
        isDone: isDone ?? this.isDone,
        isDeleted: isDeleted ?? this.isDeleted,
      );
    }


  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'id': id,
      'description': description,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      id: map['id'] ?? '',
      description: map['description'],
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
    );
  }
  
  @override
  List<Object?> get props => [
    title,
    id,
    description,
    isDone,
    isDeleted
  ];

}
