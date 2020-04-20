import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context,taskData,child){
        return taskData.tasks.isEmpty
            ? Center(child: Text('No Task added!'))
            : ListView.builder(
          itemCount: taskData.noOfTasks(),
          itemBuilder: (BuildContext context, int index) {
            return TaskTile(taskData.tasks[index]);
          },
        );
      },
    );

  }
}
