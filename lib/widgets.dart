import 'package:flutter/material.dart';
import 'package:honeyDo/theme/custom_theme.dart';


/// Displays all of the task on a given list.
class TaskCardWidget extends StatelessWidget {
  /// The unique id number of this object
  final String id;
  /// The user-chosen title
  final String? title;
  /// The user-chosen description
  final String? desc;
  /// A list of every task belonging to this TaskCardWidget
  final List<String> taskIds;

  /// Constructor
  // A constructor for a [StatelessWidget] must be provided with all of
  // its variables as final. All but the id# may be null
  TaskCardWidget({required this.id, this.title, this.desc, this.taskIds = const []});

  /// Redraws the contents when one is toggled
  void redraw(String task) {
    // TODO pass a task to get toggled. Has something to do with TaskToggler, but I'm tired and forget
  }

  @override
  Widget build(BuildContext context) {
    ListView.builder(
      padding: const EdgeInsets.all(32),
      itemCount: taskIds.length,
      itemBuilder: (BuildContext context, int index) {
        // TODO instead of returning a Container, needs to return a TodoWidget
        return Container(
          height: 50,
          color: Colors.lightGreen[600],
          child: Center(child: Text('Task with id# ${taskIds[index]}')),
        );
      }
    );
    throw 'Something went wrong in TaskCardWidget\'s builder';
  }
}
/// TaskToggler allows a TaskCardWidget to redraw its contents
class TaskToggler extends StatelessWidget {
//TODO I have no recollection of how this is suppossed to facilitate communication between the other two widgets
  @override
  Widget build(BuildContext context) {
    return Container (
      child: Text('test test test, this is a real class now'),
    );
  }

}

/// TodoWidget is created by a TaskCardWidget to display a single item on a list
class TodoWidget extends StatelessWidget {
  ///Constructor
  TodoWidget({
    this.task = '',
    required this.isDone,
    required this.onToggle,
  }) : super(key: ObjectKey(String));

  /// The description of the task
  final String task;

  /// Whether the task is done or not
  final bool isDone;

  /// Calls the TaskCardWidget's TastkToggler to rebuild this TodoWidget
  final TaskToggler onToggle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: (
          isDone ? Icon(
            Icons.check_box_outlined,
            //color: HoneyDoTheme.?? //TODO link color theme
            size: 20.0,
          )
              : Icon(
            Icons.check_box_outline_blank,
            //color: HoneyDoTheme.?? //TODO link disabled color
            size: 20.0,
          )
      ),
      title: Text(task),
    );
  }
}
