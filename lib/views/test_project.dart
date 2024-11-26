import 'package:flutter/material.dart';

class TestProject extends StatefulWidget {
  const TestProject({super.key});

  @override
  State<TestProject> createState() => _TestProjectState();
}

class _TestProjectState extends State<TestProject> {
  final TextEditingController text = TextEditingController();
  String result = "";
  


  void _checkString() {
    setState(() {
      if(result == "Firuz") {
        result = "Welcome Firuz !";
      }else {
        result = "Please try again";
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Controller",
          style: TextStyle(color: Colors.white),
          ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        color: Colors.yellow,
        child: Column(
          
          children: [
            TextField(
              controller: text,
              decoration: const InputDecoration(
                border: OutlineInputBorder()
              ),
            ),
            ElevatedButton(
              onPressed: _checkString, 
              child: Text("PRESS")
            )
          ],
        ),
      ),
    );
  }
}