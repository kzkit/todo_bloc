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
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Image.asset('assets/img/lime-list-is-empty.png'),
              ),
              Text(
                'You have no tasks.',
                textAlign: TextAlign.center,
              ),
            ],
          );
        } else if (state is TaskLoaded) {
          final tasks = state.task;
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return Dismissible(
                background: Container(color: Theme.of(context).errorColor),
                key: Key(tasks[index].id.toString()),
                child: Card(
                  color: Colors.black26,
                  //TODO: Add touch behavior to swipe to delete
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white70,
                      radius: 25,
                      child: Text(DateFormat.Md()
                          .format(DateTime.parse(tasks[index].dateTime))),
                    ),
                    title: Text(tasks[index].task),
                    subtitle: Text(tasks[index].note),
                    trailing: Text(tasks[index].priority),
                  ),
                ),
                onDismissed: (direction) {
                  BlocProvider.of<TaskBloc>(context)
                      .add(DeleteTask(id: tasks[index].id));
                  //add a snackbar to show deletion
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("Task deleted")));
                },
              );
            },
          );
        }
      },
    );
  }
}
