import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_bloc/model/task.dart';

class DBProvider {
  //create a singleton
  DBProvider._();
  static final DBProvider db = DBProvider._();
  Database _db;

  Future<Database> get database async {
    if (_db != null) {
      return _db;
    }
    //if no db, we initialize the DB
    _db = await initDB();
    return _db;
  }

  initDB() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'app.db');

    // open the database
    return await openDatabase(path, version: 1, onOpen: (db) async {},
        onCreate: (Database db, int version) async {
      // Create the task table
      await db.execute(
          'CREATE TABLE task(id INTEGER PRIMARY KEY, task TEXT, priority TEXT, note TEXT, dateTime text)');
    });
  }

  //add new Task
  newTask(Task task) async {
    final db = await database;
    await db.insert('task', task.toJson());
  }

  //get all Task
  Future<List<Task>> getTasks() async {
    final db = await database;
    var res = await db.query('task');
    //put into a list of Tasks if table is not empty
    List<Task> tasks =
        res.isNotEmpty ? res.map((note) => Task.fromJson(note)).toList() : [];
    return tasks;
  }

  updateTask(Task task) async {
    final db = await database;
    //update task according to id
    await db
        .update('task', task.toJson(), where: 'id = ?', whereArgs: [task.id]);
  }

  deleteTask(int id) async {
    final db = await database;
    //delete the task according to the id
    db.delete('task', where: 'id = ?', whereArgs: [id]);
  }
}
