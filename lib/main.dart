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
        brightness: Brightness.dark,
        primaryColor: Color.fromRGBO(48, 63, 159, 1),
        accentColor: Color.fromRGBO(3, 169, 244, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<TaskBloc>(
        create: (context) => TaskBloc(dbProvider: DBProvider.db),
        child: App(),
      ),
    );
  }
}
