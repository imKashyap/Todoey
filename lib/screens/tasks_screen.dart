import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            showModalBottomSheet(
                context: context, builder: (context) => AddTaskScreen(width));
          }),
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: height * 0.03,
                left: width * 0.05,
                right: width * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircleAvatar(
                        radius: width * 0.08,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.list,
                          size: width * 0.09,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      Material(
                        elevation: 15.0,
                        borderRadius:
                            BorderRadius.all(Radius.circular(width * 0.03)),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(width * 0.03))),
                          child: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              await showDeleteAllDialogBox(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: width * 0.03,
                  ),
                  Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${Provider.of<TaskData>(context).noOfTasks()} Task(s)',
                    style:
                        TextStyle(color: Colors.white, fontSize: width * 0.05),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: height * 0.03),
                padding: EdgeInsets.only(
                  left: width * 0.05,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(width * 0.07),
                    topRight: Radius.circular(width * 0.07),
                  ),
                ),
                child: TasksList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Widget> showDeleteAllDialogBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Deletion'),
        content: Text(Provider.of<TaskData>(context).noOfTasks() != 0
            ? 'Are you sure you want to permanently remove all tasks?'
            : 'Add some tasks first.'),
        actions: Provider.of<TaskData>(context).noOfTasks() != 0
            ? <Widget>[
                RaisedButton(
                  onPressed: () {
                    Provider.of<TaskData>(context, listen: false)
                        .clearAllTasks();
                    Navigator.pop(context);
                  },
                  child: Text('Yes'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('No'),
                )
              ]
            : <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
      ),
    );
  }
}
