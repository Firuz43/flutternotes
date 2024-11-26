import 'package:flutter/material.dart';

class TestProject extends StatefulWidget {
  const TestProject({super.key});

  @override
  State<TestProject> createState() => _TestProjectState();
}

class _TestProjectState extends State<TestProject> {
  final TextEditingController _text = TextEditingController();

  final TextEditingController _number1 = TextEditingController();
  final TextEditingController _number2 = TextEditingController();

  String result = "";
  


void addNumbers() {
  final String number1Text = _number1.text;
  final String number2Text = _number2.text;

  if(number1Text.isNotEmpty && number2Text.isNotEmpty) {
    final double number1 = double.tryParse(number1Text) ?? 0;
    final double number2 = double.tryParse(number2Text) ?? 0;
  }
}

  void _checkString() {
    setState(() {
      result = _text.text;
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
              controller: _text,
              decoration: const InputDecoration(
                border: OutlineInputBorder()
              ),
            ),
            ElevatedButton(
              onPressed: _checkString, 
              child: Text("PRESS")
            ),
            Text(
              result,
            ),
            SizedBox(height: 20,),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder()
              ),
            ),

            const SizedBox(height: 15),

            TextField(  
              decoration: const InputDecoration(
                border: OutlineInputBorder()
              ),
            )
          ],
        ),
      ),
    );
  }
}