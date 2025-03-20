class TaskModel {
  int? id;
  String title;
  String? description;
  int status; // 0 - Chưa hoàn thành, 1 - Hoàn thành
  String? dueDate;
  String? createdAt;
  String? updatedAt;

  TaskModel({
    this.id,
    required this.title,
    this.description,
    this.status = 0,
    this.dueDate,
    this.createdAt,
    this.updatedAt,
  });

  // Chuyển object Task thành Map để lưu vào SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
      'due_date': dueDate,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  // Chuyển Map từ SQLite thành object Task
  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      status: map['status'],
      dueDate: map['due_date'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }
}
