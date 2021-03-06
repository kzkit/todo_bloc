import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bloc/task_bloc.dart';
import 'package:todo_bloc/model/task.dart';
import 'package:todo_bloc/widgets/task_list.dart';
import 'package:todo_bloc/widgets/add_task.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TaskBloc>(context).add(GetTasks());
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Tasks'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: TaskList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Task task = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskAdder(),
              ));
          BlocProvider.of<TaskBloc>(context).add(AddTask(task: task));
        },
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
