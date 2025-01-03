import 'package:flutter/material.dart';

class ToDoListApp extends StatefulWidget {
  const ToDoListApp({super.key});

  @override
  State<ToDoListApp> createState() => _ToDoListAppState();
}

class _ToDoListAppState extends State<ToDoListApp> {

  //List to store tasks
  final List<Map<String, dynamic>> tasks = []; // each task is map with 'title' and 'isCompleted

  // Controller to capture input
  final TextEditingController taskController = TextEditingController();

  // function to add new task
  void addTask() {
    if(taskController.text.isNotEmpty) {
      setState(() {
        tasks.add({'title': taskController.text, 'isCompleted': false});
        taskController.clear(); // Clear the input field
      });
    }
  }

  //function to toggle comletetion status of a task
  void toggleTask(int index) {
    setState(() {
      tasks[index]['isCompleted'] = !tasks[index]['isCompleted'];
    });
  }

  //function delete a task
  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To do list",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}