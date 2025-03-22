import 'package:intl/intl.dart';

enum Priority {
  high,
  medium,
}

class TaskModel {
  int? id;
  String title;
  String? description;
  int status;
  String? _dueDate;
  String? createdAt;
  String? updatedAt;
  Priority? priority;

  TaskModel({
    this.id,
    required this.title,
    this.description,
    this.status = 0,
    String? dueDate,
    this.createdAt,
    this.updatedAt,
    this.priority,
  }) : _dueDate = dueDate;

  String get getCreateDate {
    if (createdAt == null || createdAt!.isEmpty) {
      return '';
    }
    try {
      DateTime date = DateTime.parse(createdAt!);
      return DateFormat('HH:mm dd/MM/yyyy').format(date);
    } catch (e) {
      return '';
    }
  }
  String get dueDate {
    if (_dueDate == null || _dueDate!.isEmpty) {
      return '';
    }
    try {
      DateTime date = DateTime.parse(_dueDate!);
      return DateFormat('dd/MM/yyyy').format(date);
    } catch (e) {
      return '';
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
      'due_date': _dueDate,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'prioritize': priority?.name,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      status: map['status'],
      dueDate: map['due_date'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      priority: map['prioritize'] == 'high'
          ? Priority.high
          : map['prioritize'] == 'medium'
          ? Priority.medium
          : null,
    );
  }
}