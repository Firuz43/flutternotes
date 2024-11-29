import 'package:flutter/material.dart';

class Practice extends StatefulWidget {
  const Practice({super.key});

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  String restult = "";

  final List<String> items = [];

  final TextEditingController inputController = TextEditingController();


  void addItem() {
    if(inputController.text.isNotEmpty) {
      setState(() {
        restult = inputController.text;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Practice",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: inputController,
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
            ),
            Text(
              restult
            ),
            ElevatedButton(
              onPressed: addItem, 
              child: Text("ADD")
            )
          ],
        ),
      ),
    );
  }
}