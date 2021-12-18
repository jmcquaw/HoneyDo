import 'dart:html';

import 'package:flutter/material.dart';
import 'package:honeyDo/widgets.dart';
import '../service/honeyXML.dart';


//second page of the app for the new added tasks
class taskpage extends StatefulWidget {
  taskpage();

  @override
  _taskpageState createState() => _taskpageState();

}

class _taskpageState extends State<taskpage> {











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
                        Navigator.pop(context); //this lets user go back to previous page
                        },
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Image(
                         image: AssetImage('assets/images/back_arrow_icon.png'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField( //text field for the new task title
                        decoration: InputDecoration(
                          hintText: "Enter Task Title",
                          border: InputBorder.none, //gets rid of the border
                        ),
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF211551),
                        ),
                        ),
                      )
                  ],
                ),
              ),
              TextField( //text field for new task description
                decoration: InputDecoration(
                  hintText: "What would you like to get done today?",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 24.0,
                  )
                ),
              ),
              TodoWidget(),

              ElevatedButton(
                onPressed: () {
                  toggleStatus();

                },
                child: const Text("run test function 1"),
              ),
              ElevatedButton(
                onPressed: () {
                  toggleStatus();

                },
                child: const Text("run test function 2"),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
