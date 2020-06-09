import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bloc/task_bloc.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TaskBloc taskBloc = BlocProvider.of<TaskBloc>(context);

    return BlocBuilder<TaskBloc, TaskState>(
      bloc: taskBloc,
      builder: (context, state) {
        if (state is TaskEmpty) {
          return Center(
            child: Text('Add some tasks now!'),
          );
        } else if (state is TaskLoaded) {
          final tasks = state.task;
          return Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index].task),
                );
              },
            ),
          );
        }
      },
    );
  }
}
