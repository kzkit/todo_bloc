import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskAdder extends StatefulWidget {
  @override
  _TaskAdderState createState() => _TaskAdderState();
}

class _TaskAdderState extends State<TaskAdder> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _taskTextController = TextEditingController();
  final TextEditingController _noteTextController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  String priorityTask = "Urgent";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextFormField(
                controller: _taskTextController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please write some task!";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Task',
                ),
              ),
              SizedBox(height: 12),
              Row(
                children: <Widget>[
                  Text(
                    "${DateFormat.yMMMMd().format(selectedDate)}",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    child: Text('Choose Date'),
                    onPressed: () => _selectDate(context),
                  )
                ],
              ),
              TextFormField(
                controller: _noteTextController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please write some task!";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Notes',
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: const Text('Urgent'),
                      leading: Radio(
                        value: "Urgent",
                        groupValue: priorityTask,
                        onChanged: (value) {
                          setState(() {
                            priorityTask = value;
                            print(priorityTask);
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text('Not Urgent'),
                      leading: Radio(
                        value: "Not Urgent",
                        groupValue: priorityTask,
                        onChanged: (value) {
                          setState(() {
                            priorityTask = value;
                            print(priorityTask);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              ButtonTheme(
                minWidth: 150.00,
                height: 40.00,
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text('Add Task'),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      //TODO: should change all the text to Task model then send it back via navigator
                      // Navigator.pop(context, //result too);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
