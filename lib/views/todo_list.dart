import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<Map<String, dynamic>> _tasks = [];
  final TextEditingController _taskController = TextEditingController();

  void _addTask(String taskName) {
    if(taskName.isNotEmpty) {
      setState(() {
        _tasks.add({'name': taskName, 'isCompleted': false});
      });
      _taskController.clear(); // clear input field
    }
  }

  void _toggleTask(int index) {
    setState(() {
      _tasks[index]['isCompleted'] = !_tasks[index]['isCompleted'];
    });
  }


  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Todo List",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: const InputDecoration(
                      labelText: "Enter Task",
                      border: OutlineInputBorder()
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: () => _addTask(_taskController.text), 
                  child: const Text("Add")
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,//ß
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return ListTile(
                  leading: Checkbox(
                    value: task['isCompleted'], 
                    onChanged: (_) => _toggleTask(index),
                  ),
                  title: Text(
                    task['name'],
                    style: TextStyle(
                      decoration: task['isCompleted'] ? TextDecoration.lineThrough : TextDecoration.none
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () => _deleteTask(index), 
                    icon: const Icon(Icons.delete, color: Colors.red,)
                  ),
                );
              }
            )
          )
        ],
      ),
    );
  }
}