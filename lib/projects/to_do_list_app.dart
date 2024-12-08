import 'package:flutter/material.dart';

class ToDoListApp extends StatefulWidget {
  const ToDoListApp({super.key});

  @override
  State<ToDoListApp> createState() => _ToDoListAppState();
}

class _ToDoListAppState extends State<ToDoListApp> {
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