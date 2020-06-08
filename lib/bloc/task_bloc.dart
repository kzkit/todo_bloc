import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_bloc/model/task.dart';
import 'package:todo_bloc/repositories/database.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final DBProvider dbProvider;

  TaskBloc({this.dbProvider}) : assert(dbProvider != null);

  @override
  TaskState get initialState => TaskEmpty();

  @override
  Stream<TaskState> mapEventToState(TaskEvent event) async* {
    if (event is GetTasks) {
      yield* _mapGetTaskToState(event);
    } else if (event is AddTask) {
      yield* _mapAddTaskToState(event);
    } else if (event is EditTask) {
      yield* _mapEditTaskToState(event);
    } else if (event is DeleteTask) {
      yield* _mapDeleteTaskToState(event);
    }
  }

  Stream<TaskState> _mapGetTaskToState(TaskEvent event) async* {}
  Stream<TaskState> _mapAddTaskToState(TaskEvent event) async* {}
  Stream<TaskState> _mapEditTaskToState(TaskEvent event) async* {}
  Stream<TaskState> _mapDeleteTaskToState(TaskEvent event) async* {}
}
