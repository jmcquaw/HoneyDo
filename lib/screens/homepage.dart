import 'package:flutter/material.dart';
import 'package:honeyDo/screens/doList.dart';
import 'package:honeyDo/screens/taskpage.dart';

//stateful widget because the UI will change dynamically as new lists get added
class homepage extends StatefulWidget {
  final List<doList> lists;//this is the list of objects that contains all of the data

  homepage({Key? key, required this.lists}) : super(key: key);//allows for passing of data between screens

  @override
  _homepageState createState() => _homepageState();//make screen state
}

class _homepageState extends State<homepage> {
  List<ElevatedButton> buttonsList = <ElevatedButton>[]; //a list of buttons

  @override
  void initState() {
    super.initState(); //runs on initialization
  }

  List<Widget> buildListButtons() {
    buttonsList = []; //this clears the list so that every the screen loads it doesnt duplicate data
    buttonsList.add(new ElevatedButton( //make the new list button first
      onPressed: () {
        widget.lists.add(doList("My List #" + widget.lists.length.toString(), widget.lists.length, [])); //new list with a default generated name and id and empty tasks

        Navigator.push( //push to route stack
            context,
            MaterialPageRoute(
                builder: (context) => taskpage( //go to taskpage with the following arguments
                    activeID: widget.lists[widget.lists.length - 1].lid, //generate the next ID
                    lists: widget.lists)));//pass the main list object
      }, //
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xffC8A4F8)), //make it pretty
          textStyle: (MaterialStateProperty.all(
              TextStyle(color: Colors.white, fontSize: 18)))),//make it pretty
      child: Text("Add New List"),
    ));
    for (int i = widget.lists.length - 1; i > -1; i--) { //generate buttons for each list
      buttonsList.add(new ElevatedButton(
          //make a button
          onLongPress: () {//long hold will delete an item but will make a popup to confirm
            deleteWarning(context, i);//trigger dialog
          },
          onPressed: () {
            Navigator.push(//push to route stack
                context,
                MaterialPageRoute(
                    builder: (context) => taskpage( //go to taskpage with the following arguments
                        activeID: widget.lists[i].lid, lists: widget.lists)));//pass corresponding id of tapped list and the main lists object
          },
          //this passes the associated ID so we know where to read on the other side
          style: ButtonStyle(
              //just making it pretty
              backgroundColor: MaterialStateProperty.all(Color(0xffdfecb7)),//make it pretty
              textStyle: (MaterialStateProperty.all(
                  TextStyle(color: Colors.black, fontSize: 18)))),//make it pretty
          child: Text(widget.lists[i].title)));
    }
    return buttonsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7ad45),
      body: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(45, 50, 45, 0), //dont touch edges
              child: AspectRatio(
                  aspectRatio: 982 / 320, //ensures the logo fits properly
                  child: Image.asset(
                    'assets/images/logowtag.png',
                    fit: BoxFit.fill, //fills the correct space dynamically
                    alignment: Alignment.center, //keeps in place
                  ))),
          Expanded(
            child: Container(
                // width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                //leave a little room
                alignment: Alignment.topCenter,
                //snap to top
                child: ListView(
                  //scrollable list
                  children: buildListButtons(),//populate with buttons
                )),
          )
        ],
      ),
    );
  }


//make a dialog to warn user about deletion
  Future<void> deleteWarning(BuildContext context, int listID) async { //this needs to be asynchronous
    showDialog(
        context: context,
        barrierDismissible: false, //USER CANNOT IGNORE THIS POPUP
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('DELETE LIST'),
            content:
                Text('Are you sure to delete this list? This cannot be undone'),
            actions: [
              // yes button
              TextButton(
                  onPressed: () { //if confirmed run the delete list function
                    deleteList(listID);
                    setState(() { //refreshscreen
                    });
                    Navigator.of(context).pop();// Close the dialog

                  },
                  child: Text('Yes')),
              //no button
              TextButton(
                  onPressed: () { //do nothing
                    Navigator.of(context).pop();// Close the dialog
                  },
                  child: Text('No'))
            ],
          );
        });
  }
//delete list from main object
  void deleteList(int listID) {
    widget.lists.removeAt(listID); //remove lists
    reformatLists(); //refactors and reassigns IDs so things are sequential
  }

  void reformatLists() {
    for (int i = 0; i < widget.lists.length; i++) {
      widget.lists[i].lid = i; //assigns lid to correnspond with length, keeps things sequential and in creation order
    }
  }
} //state
