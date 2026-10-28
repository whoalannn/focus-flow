enum TaskPriority { high, medium, low }

class TaskModel {
  final String id;
  final String title;
  final String course;
  final TaskPriority priority;
  final DateTime dueDate;
  final int estimatedMinutes;
  bool isCompleted;

  TaskModel({
    required this.id,
    required this.title,
    required this.course,
    required this.priority,
    required this.dueDate,
    required this.estimatedMinutes,
    this.isCompleted = false,
  });

  TaskModel copyWith({
    String? id,
    String? title,
    String? course,
    TaskPriority? priority,
    DateTime? dueDate,
    int? estimatedMinutes,
    bool? isCompleted,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      course: course ?? this.course,
      priority: priority ?? this.priority,
      dueDate: dueDate ?? this.dueDate,
      estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
