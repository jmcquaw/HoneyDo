import 'package:flutter/material.dart';
import 'package:honeyDo/screens/doList.dart';
import 'package:honeyDo/screens/task.dart';

import 'homepage.dart';

//second page of the app for the new added tasks
class taskpage extends StatefulWidget {
  final int activeID; //this var keeps track of which dolist we are working on
  final List<doList> lists; //this is the list of objects that contains all of the data

  taskpage({Key? key, required this.lists, required this.activeID})
      : super(key: key); //allows for passing of data between screens

  @override
  _taskpageState createState() => _taskpageState(); //make screen state
}

class _taskpageState extends State<taskpage> {
  List<Dismissible> checkboxList = <Dismissible>[];
  final titleTEC = TextEditingController();
  final taskTEC = TextEditingController();

  List<Widget> buildTasks() {
    checkboxList = [];
    for (int i = 0; i < widget.lists[widget.activeID].tasks.length; i++) {
      //generate a list of checkboxestiles
      bool temp = widget.lists[widget.activeID].tasks[i].status; //this temp bool is to set initial state of thebox

      checkboxList.add(new Dismissible(
          key: UniqueKey(),
          background: Container(color: Colors.red),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            setState(() {
              widget.lists[widget.activeID].tasks.removeAt(i);
            });
          },
          child: CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              //put the checkbox before the text
              activeColor: Colors.black,
              //pretty
              checkColor: Colors.white,
              //pretty
              selected: widget.lists[widget.activeID].tasks[i].status,
              selectedTileColor: Color(0xff77DD76),
              title: Text(widget.lists[widget.activeID].tasks[i].description),
              value: temp,
              tileColor: Color(0xffD2FDBB),
              enableFeedback: true,
              //haptic/audio on interact
              onChanged: (temp) {
                setState(() {
                  widget.lists[widget.activeID].tasks[i].status = !widget.lists[widget.activeID].tasks[i].status;
                }); //flip the status in the object and refresh the screeen
              })));
    }
    return checkboxList;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffdfd97),
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
                                    homepage(lists: widget.lists))); //go back to homepage and pass the lists
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Image(
                          image: AssetImage('assets/images/back_arrow_icon.png'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: titleTEC,
                        onSubmitted: (String value) {
                          setState(() {
                            widget.lists[widget.activeID].title = value; //update title and refresh screen
                            taskTEC.clear(); //clears the text field
                          });
                        },
                        //text field for the new task title
                        decoration: InputDecoration(
                          hintText: widget.lists[widget.activeID].title,
                          hintStyle: TextStyle(color: Colors.black),
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
                autofocus: true, //make the cursor start here
                onSubmitted: (String value) {
                  setState(() {
                    //update the list and refresh the screen
                    widget.lists[widget.activeID].tasks.add(task(
                        value, false, widget.lists[widget.activeID].tasks.length)); //make a new task with entered data
                    taskTEC.clear();
                  });
                },

                decoration: InputDecoration(
                    hintText: "What would you like to get done today?",
                    hintStyle: TextStyle(fontStyle: FontStyle.italic, color: Colors.black),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 24.0,
                    )),
              ),
              Expanded(
                child: Container(
                    // width: double.infinity,
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    //leave a little room
                    alignment: Alignment.topCenter,
                    //snap to top
                    child: ListView(
                      //scrollable list
                      children: buildTasks(), //populate all tasks
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
