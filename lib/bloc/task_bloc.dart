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
    } else if (event is DeleteTask) {
      yield* _mapDeleteTaskToState(event);
    }
  }

  Stream<TaskState> _mapGetTaskToState(GetTasks event) async* {
    try {
      final List<Task> tasks = await dbProvider.getTasks();
      print(tasks.length);
      if (tasks != null && tasks.length > 0) {
        yield TaskLoaded(task: tasks);
      } else {
        yield TaskEmpty();
      }
    } catch (_) {}
  }

  Stream<TaskState> _mapAddTaskToState(AddTask event) async* {
    try {
      await dbProvider.newTask(event.task);
      final List<Task> tasks = await dbProvider.getTasks();
      if (tasks != null && tasks.length > 0) {
        yield TaskLoaded(task: tasks);
      } else {
        yield TaskEmpty();
      }
    } catch (_) {}
  }

  Stream<TaskState> _mapDeleteTaskToState(DeleteTask event) async* {
    try {
      await dbProvider.deleteTask(event.id);
      final List<Task> tasks = await dbProvider.getTasks();
      if (tasks != null && tasks.length > 0) {
        yield TaskLoaded(task: tasks);
      } else {
        yield TaskEmpty();
      }
    } catch (_) {}
  }
}
