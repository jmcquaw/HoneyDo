import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final String? title;
  final String? desc;
  TaskCardWidget({this.title, this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 32.0,
        horizontal: 24.0,
      ),
      margin: EdgeInsets.only(
        bottom: 20.0,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? "(Unnamed Task)", //this will let us pass in title to empty task widgets in homepage
            style: TextStyle(
              color: Color(0xFF55A469),
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 32.0,
            ),
            child: Text(
              desc ?? "No description added", //this will let us pass in desc to empty task widgets in homepage
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xFF868290),
                  height: 1.5
                ),
            ),
          )
        ],
      ),
    );
  }
}

//checkbox widget
class TodoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 8.0,
      ),
      child: Row(
        children: [
          Container(
            width: 20.0,
            height: 20.0,
            margin: EdgeInsets.only(
              right: 16.0,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF9f81f9),
                  borderRadius: BorderRadius.circular(6.0),
            ),
            child: Image(
              image: AssetImage(
                'assets/images/check_icon.png'
              ),
            ),
          ),
          Text(
              "Todo Widget",
            style: TextStyle(
              color: Color(0xFF211551),
          ),
          ),
        ],
      ),
    );
  }
}
