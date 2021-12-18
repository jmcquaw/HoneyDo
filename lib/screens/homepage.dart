import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:flutter/src/material/material_state.dart';
import 'package:honeyDo/screens/taskpage.dart';
import 'package:xml/xml.dart';

//stateful widget because the UI will change dynamically as new lists get added
/*
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
  static final String id = 'homepage';
}

class _HomepageState extends State<Homepage> {
  //ClientSdkService clientSdkService = ClientSdkService.getInstance();
  //String activeAtSign = '';
  final children = <TaskCardWidget>[];

  // Future<void> getAtSign() async {
  //   String? currentAtSign = await clientSdkService.getAtSign();
  //   setState(() {
  //     activeAtSign = currentAtSign!;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //makes sure that the widget doesnt cross into status bar of a phone
        child: Container(
          //adding Container widget gives us easier access to modify child widgets (padding, height, width etc)
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
              )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //positions everything starting from left to right
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 5.0,
                      bottom: 32.0,
                    ),
                    child: Image(
                      image: AssetImage(
                        //images are found in the assets folder
                        'assets/images/melonlogo.png',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        TaskCardWidget(
                            //first widget you see on start screen
                            title: "Get Started with HoneyDo!",
                            desc:
                                "Hello! Welcome to this simple, yet efficient to-do list."),
                        TaskCardWidget(), //empty task widgets
                        TaskCardWidget(),
                        TaskCardWidget(),
                        TaskCardWidget(),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                //lets us place the widgets where we want them to be
                bottom: 24.0,
                right: 0.0,
                child: GestureDetector(
                  //lets user click to new task page
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
                      color: Color(0xFF6955a4),
                      borderRadius:
                          BorderRadius.circular(20.0), //changes image border
                    ),
                    child: Image(
                        //floating action button
                        image: AssetImage(
                      "assets/images/add_icon.png",
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
class homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _homepageState();
  }
}

class _homepageState extends State<homepage> {
  var titlesList = <String>[]; //these are initializations for access on demand
  List<ElevatedButton> buttonsList = <ElevatedButton>[];

  //todo figure out why this refuses actual files but doesnt crash with an explicit string
  final honeyxml = XmlDocument.parse('''
    <?xml version="1.0"?>
<root>
	<list lid='0'>
		<title>chores</title>
		<task tid='0'>
			<description>laundry</description>
			<status>false</status>
		</task>
		<task tid='1'>
			<description>dishes</description>
			<status>false</status>
		</task>
		<task tid='2'>
			<description>trash</description>
			<status>false</status>
		</task>
	</list>
	<list lid='1'>
		<title> xmas gifts</title>
		<task tid='0'>
			<description>vinyl record - james</description>
			<status>true</status>
		</task>
		<task tid='1'>
			<description>sweater - mom</description>
			<status>false</status>
		</task>
		<task tid='2'>
			<description>apple gift card - aidan</description>
			<status>true</status>
		</task>
	</list>
</root>''');

  @override
  void initState() {
    super.initState(); //runs on initialization

    //String raw = new File('test.xml'); //takes the whole file as a string (currently doesnt work)
    //print("filereadnotfail");
    //print(raw.toString()); //this line exists for debugging purposes
    print("attempting to parse");
    //takes the string and returns an xml document type
    print("xmlreadfine"); //debugstuff
    var titles = honeyxml.findAllElements(
        "title"); //search for the element with a title tag, toss all results in a list
    titles.map((node) => node.text).forEach((content) {
      //get the content from the title tags
      titlesList.add(content);
    });
  }

  List<Widget> buildListButtons() {
    buttonsList.add(new ElevatedButton( //the first item in the list will generate a new list button
      onPressed: null, //TODO PASS DATA WITH THIS
      //passing -1 will indicated for the taskpage to generate a new list
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xffC8A4F8)),
          textStyle: (MaterialStateProperty.all(
              TextStyle(color: Colors.white, fontSize: 18)))),
      child: Text("Add New List"),
    ));
    for (int i = 0; i < titlesList.length; i++) { //all of these buttons are generated from the xml lists tags
      buttonsList.add(new ElevatedButton(
          //make a button

          onPressed: null, //TODO PASS DATA WITH THIS, WE NEED ANY STRING TO COME OUT ON THE OTHER SIDE
          //this passes the associated ID so we know where to read on the other side
          style: ButtonStyle(
              //just making it pretty
              backgroundColor: MaterialStateProperty.all(Color(0xffdfecb7)),
              textStyle: (MaterialStateProperty.all(
                  TextStyle(color: Colors.black, fontSize: 18)))),
          child: Text(titlesList[i])));
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
                  children: buildListButtons(),
                )),
          )
        ],
      ),
    );
  }
}
