import 'package:flutter/material.dart';
import 'package:honeyDo/widgets.dart';
import 'package:honeyDo/screens/taskpage.dart';

//stateful widget because the UI will change dynamically as new lists get added
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( //makes sure that the widget doesnt cross into status bar of a phone
        child: Container( //adding Container widget gives us easier access to modify child widgets (padding, height, width etc)
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 32.0,
          ),
          color: Color(0xFFF6F6F6),
          child: Stack(
            children: [
              Container(
              margin: EdgeInsets.only(
                top: 32.0,
                bottom: 32.0,

          )
          ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, //positions everything starting from left to right
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 5.0,
                      bottom: 32.0,
                    ),
                    child: Image(
                      image: AssetImage( //images are found in the assets folder
                        'assets/images/logo.png',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        TaskCardWidget( //first widget you see on start screen
                          title: "Get Started with HoneyDo!",
                          desc: "Hello! Welcome to this simple, yet efficient to-do list."
                      ),
                       TaskCardWidget(), //empty task widgets
                       TaskCardWidget(),
                       TaskCardWidget(),
                       TaskCardWidget(),
                    ],
                  ),
                  )
                ],
              ),


            Positioned( //lets us place the widgets where we want them to be
              bottom: 24.0,
              right: 0.0,
              child: GestureDetector( //lets user click to new task page
                onTap: () {
                  Navigator.push(
                    context,
                      MaterialPageRoute(
                        builder: (context) => Taskpage() //takes user here
                      ),
                  );
                },
                child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Color(0xFF6955a4

                  ),
                      borderRadius: BorderRadius.circular(20.0), //changes image border
                ),
                child: Image( //floating action button
                  image: AssetImage(
                    "assets/images/add_icon.png",
                  )
                ),
              ),
            ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
