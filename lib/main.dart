import 'package:flutter/material.dart';
import 'package:todo_bloc/bloc/task_bloc.dart';
import 'package:todo_bloc/repositories/database.dart';
import 'package:todo_bloc/widgets/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<TaskBloc>(
        create: (context) => TaskBloc(dbProvider: DBProvider.db),
        child: App(),
      ),
    );
  }
}
