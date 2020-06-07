import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_bloc/model/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  @override
  TaskState get initialState => TaskEmpty();

  @override
  Stream<TaskState> mapEventToState(
    TaskEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
