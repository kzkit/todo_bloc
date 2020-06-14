import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bloc/task_bloc.dart';
import 'package:intl/intl.dart';

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
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return Card(
                //TODO: Add touch behavior to swipe to delete
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    child: Text(DateFormat.Md()
                        .format(DateTime.parse(tasks[index].dateTime))),
                  ),
                  title: Text(tasks[index].task),
                  subtitle: Text(tasks[index].note),
                  trailing: Text(tasks[index].priority),
                ),
              );
            },
          );
        }
      },
    );
  }
}
