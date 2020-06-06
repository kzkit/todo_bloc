import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final int id;
  final String task;
  final String note;
  final String priority;
  final String dateTime;

  Task({this.id, this.task, this.note, this.priority, this.dateTime});

  @override
  List<Object> get props => [task, note, priority, dateTime];

  // Create a Task from JSON data
  factory Task.fromJson(Map<String, dynamic> json) => new Task(
        id: json["id"],
        task: json["task"],
        note: json["note"],
        priority: json["priority"],
        dateTime: json["dateTime"],
      );

  // Convert our Task to JSON to make it easier when we store it in the database
  Map<String, dynamic> toJson() => {
        "id": id,
        "task": task,
        "note": note,
        "priority": priority,
        "dateTime": dateTime,
      };
}
