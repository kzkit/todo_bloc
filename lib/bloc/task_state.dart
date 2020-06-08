part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();
}

class TaskEmpty extends TaskState {
  @override
  List<Object> get props => [];
}

class TaskLoaded extends TaskState {
  final List<Task> task;

  TaskLoaded({@required this.task}) : assert(task != null);

  @override
  List<Object> get props => [task];
}
