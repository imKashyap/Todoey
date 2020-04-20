import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';
class TaskTile extends StatefulWidget {
  final Task task;
  TaskTile(this.task);
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked=false;

  checkBoxCallBack(bool checkBoxState){
    setState(() {
      isChecked=checkBoxState;
    });
  }

  void longPressCallBack(){
    Provider.of<TaskData>(context,listen: false).clearThisTask(widget.task);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallBack,
      title: Text(widget.task.taskTitle,
      style: TextStyle(
        decoration: isChecked?TextDecoration.lineThrough:null,
      ),),
      trailing: TaskCheckBox(isChecked,checkBoxCallBack),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  final bool checkBoxState;
  final Function toggleCheckBoxState;
  TaskCheckBox(this.checkBoxState,this.toggleCheckBoxState);
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkBoxState,
      onChanged: toggleCheckBoxState
    );
  }
}