class Todo {
  final int id;
  final String taskTitle;
  final String taskDescription;
  final String endDate;
  final String endTime;
  final int priority;
  final int? isCompleted;

  Todo(
      {required this.id,
      required this.taskTitle,
      required this.taskDescription,
      required this.endDate,
      required this.endTime,
      required this.priority,
      this.isCompleted});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': taskTitle,
      'description': taskDescription,
      'end_date': endDate,
      'end_time': endTime,
      'priority' : priority,
      'completed': isCompleted
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
        id: map['id'],
        taskTitle: map['title'],
        taskDescription: map['description'],
        endDate: map['end_date'],
        endTime: map['end_time'],
        priority: map['priority'],
        isCompleted: map['completed']);
  }
}
