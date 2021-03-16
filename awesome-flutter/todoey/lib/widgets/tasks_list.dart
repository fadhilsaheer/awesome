import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  final List tasks;
  final Function callback;
  final Function deleteTask;

  TaskList({this.tasks, this.callback, this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: tasks[index].name,
          isChecked: tasks[index].isDone,
          checkboxCallback: (value) {
            callback(index);
          },
          deleteTask: () {
            deleteTask(index);
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
