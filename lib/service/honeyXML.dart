// /*this file contains all of the xml functions
// we need to make changes to the xml file which
// we use to store all of the lists and their
// data. due to the tiered structure it would be
// simplest to develop, debug, and in theory
// expand with features.
//  */
//
//
//
// /*TERMINOLOGY
// list: this is the list that contains tasks to do. it should populate on the
//     dashboard (homepage). contains entries that populate when opened in taskview.
//     a list is assigned a sequential ID to help make navigation of the xml tree
//     easier and intuitive.
// title: this is the name of a list, assigned by user
// task: an item in a list, it has the children description and done. this also has
//     a sequentially assigned entry ID like a list
// description: this is the user assigned task description
// status: this is the true or false condition of whether a task is complete or not
//  */
// import 'dart:core';
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// import 'package:xml/xml.dart';
//
// //the following code is directly from the flutter docs on persistent
// //file access. im changing this as little as possible because its complicated
// //and i have no real clue how it all works but if it works then im taking it
// //https://docs.flutter.dev/cookbook/persistence/reading-writing-files
// Future<String> get localPath async {
//   final directory = await getApplicationDocumentsDirectory();
//
//   return directory.path;
// }
//
// Future<File> get localFile async {
//   final path = await localPath;
//   return File('$path/test.xml');
// }
//
// Future<File> writeXML(String xmlData) async {
//   final file = await localFile;
//
//   // Write the file
//   return file.writeAsString('$xmlData');
// }
// Future<XmlDocument> readXML() async {
//     final file = await localFile;
//
//     // Read the file
//     final contents = await file.readAsString();
//
//     return XmlDocument().parse(contents);
//     // If encountering an error, return 0
//   }
//
//
// //returns the status of the task passed to the function
// String getStatus(){
//   return "testDone"; //debugging
// }
//
// //sets the status from incomplete to complete, or the reverse
// void toggleStatus(){
//         print("toggle");//debugging
//     }
//
// //returns the description of the task passed to the function
// String getDescription(){
//   return "testDescription";
// }
//
// //sets the passed task's description
// void setDescription(){
//
// }
//
// //creates a new task and returns the task id
// //NOTE: a task should not be without description and includes that as part of the function
// String newTask(){
//   return "testID of task";
// }
//
// //creates a new list an returns the list ID
// String newList(){
//   return "testID of list";
// }
//
// //sets to title of the list
// void setTitle(){}
//
// //returns the title of the list
// String getTitle(){
//   return "testTitle";
// }
//
// //this returns the number of lists in the xml file
// int countLists(XmlDocument doc){
//     var all = doc.findElements("list");
//   return all.length;
//
// }
// //returns the number of tasks in a given list
// int countTasks(){
//   return 2;
// }
// //returns the list from the document with a matching LID
//  XmlElement getList(String ID, XmlDocument document){
//     var temp = document.findAllElements("list"); //get all the lists
//     for(var element in temp){ //for every list found...
//       if(element.getAttribute('lid') == ID){return element;}//check the lid attribute and compare to the passed
//     }
//     return document.rootElement; //this line makes zero sense and would break everything if reached but its not possible to get here
//
//
// }
//
//
//
//
//
//
