import 'package:flutter/material.dart';
import 'package:honeyDo/widgets.dart';
import 'package:honeyDo/screens/taskpage.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 5.0,
                      bottom: 32.0,
                    ),
                    child: Image(
                      image: AssetImage(
                        'assets/images/logo.png',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        TaskCardWidget(
                          title: "Get Started with HoneyDo!",
                          desc: "Hello! Welcome to this simple, yet efficient to-do list."
                      ),
                       TaskCardWidget(),
                       TaskCardWidget(),
                       TaskCardWidget(),
                       TaskCardWidget(),
                    ],
                  ),
                  )
                ],
              ),


            Positioned(
              bottom: 24.0,
              right: 0.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                      MaterialPageRoute(
                        builder: (context) => Taskpage()
                      ),
                  );
                },
                child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Color(0xFF6955a4

                  ),
                      borderRadius: BorderRadius.circular(20.0),
                ),
                child: Image(
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
