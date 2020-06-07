part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
}

class GetTasks extends TaskEvent {
  @override
  List<Object> get props => [];
}

class AddTask extends TaskEvent {
  final Task task;

  AddTask({this.task}) : assert(task != null);

  @override
  List<Object> get props => [task];
}

class EditTask extends TaskEvent {
  final Task task;

  EditTask({this.task}) : assert(task != null);

  @override
  List<Object> get props => [task];
}

class DeleteTask extends TaskEvent {
  final int id;

  DeleteTask({this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}
