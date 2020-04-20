import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:todoey/models/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  final double width;
  AddTaskScreen(this.width);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController taskController=TextEditingController();
  @override
  void initState() {
    super.initState();
    taskController.text='';
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: widget.width * 0.1,
            vertical:widget.width * 0.1, ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widget.width * 0.07),
            topRight: Radius.circular(widget.width * 0.07),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              autofocus: true,
              onSubmitted: (val)=>_addTask(context),
              controller: taskController,
              style: TextStyle(
                fontSize: widget.width * 0.06,
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  labelText: 'Enter Task',
                  labelStyle: TextStyle(
                    fontSize: widget.width * 0.06,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlueAccent,
                      ),
                      borderRadius:
                          BorderRadius.all(Radius.circular(widget.width * 0.03)))),
            ),
            SizedBox(
              height: widget.width * 0.1,
            ),
            Container(
              height: widget.width * 0.15,
              child: RaisedButton(
                onPressed:()=>_addTask(context),
                color: Colors.lightBlueAccent,
                child: Text(
                  'Add Task',
                  style: TextStyle(color: Colors.white, fontSize: widget.width * 0.06),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addTask(BuildContext context){
    if(taskController.text.trim().isNotEmpty){
      Provider.of<TaskData>(context,listen: false).addTask(taskController.text.trim());
      Navigator.of(context).pop();
    }
    else{

    }
  }

}
