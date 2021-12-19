import 'package:flutter/material.dart';
import 'package:honeyDo/screens/doList.dart';
import 'package:honeyDo/screens/task.dart';

import 'homepage.dart';

//second page of the app for the new added tasks
class taskpage extends StatefulWidget {
  final int activeID;
  final List<doList> lists;

  taskpage({Key? key, required this.lists, required this.activeID})
      : super(key: key);

  @override
  _taskpageState createState() => _taskpageState();
}

class _taskpageState extends State<taskpage> {
  List<CheckboxListTile> checkboxList = <CheckboxListTile>[];
  final titleTEC = TextEditingController();
  final taskTEC = TextEditingController();

  List<Widget> buildTasks() {
    checkboxList = [];
    for (int i = 0; i < widget.lists[widget.activeID].tasks.length; i++) {
      bool temp = widget.lists[widget.activeID].tasks[i].status;
      checkboxList.add(new CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Color(0xffc5dd9f),
          checkColor: Color(0xff000000),
          title: Text(widget.lists[widget.activeID].tasks[i].description),
          value: temp,
          onChanged: (temp) {
            setState(() {
              widget.lists[widget.activeID].tasks[i].status =
                  !widget.lists[widget.activeID].tasks[i].status;
            });
          }));
    }
    return checkboxList;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 24.0,
                  bottom: 6.0,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    homepage(lists: widget.lists)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Image(
                          image:
                              AssetImage('assets/images/back_arrow_icon.png'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: titleTEC,
                        onSubmitted: (String value) {
                          setState(() {
                            widget.lists[widget.activeID].title = value;
                            taskTEC.clear();
                          });
                        },
                        //text field for the new task title
                        decoration: InputDecoration(
                          hintText: widget.lists[widget.activeID].title,
                          border: InputBorder.none, //gets rid of the border
                        ),
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF211551),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              TextField(
                controller: taskTEC,
                //text field for new task description
                autofocus: true,
                onSubmitted: (String value) {
                  setState(() {
                    widget.lists[widget.activeID].tasks.add(task(value, false,
                        widget.lists[widget.activeID].tasks.length));
                    taskTEC.clear();
                  });
                },

                decoration: InputDecoration(
                    hintText: "What would you like to get done today?",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 24.0,
                    )),
              ),

              Expanded(
                child: Container(
                    // width: double.infinity,
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    //leave a little room
                    alignment: Alignment.topCenter,
                    //snap to top
                    child: ListView(
                      //scrollable list
                      children: buildTasks(),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
