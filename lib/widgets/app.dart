import 'package:flutter/material.dart';
import 'package:todo_bloc/bloc/task_bloc.dart';
import 'package:todo_bloc/widgets/task_list.dart';
import 'package:todo_bloc/widgets/add_task.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Tasks'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: TaskList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskAdder(),
              ));
        },
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
