class TodoModel {
  final String id;
  final String title;
  final bool isCompleted;
  final DateTime createdAt;

  TodoModel({
    required this.id,
    required this.title,
     this.isCompleted = false,
    required this.createdAt,
  });

  TodoModel copyWith({
    String? id,
    String? title,
    bool? isCompleted,
    DateTime? createdAt,
}){
    return TodoModel(id: id ?? this.id, title: title?? this.title, createdAt: createdAt?? this.createdAt);
  }
}
