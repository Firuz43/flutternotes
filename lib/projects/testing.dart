import 'package:flutter/material.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  TextEditingController inputeController = TextEditingController();
  final List<String> items = [];

  void addItem() {
    setState(() {
      if(inputeController.text.isNotEmpty){
        items.add(inputeController.text);
        inputeController.clear();
      }else {
        "Please try again";
      }
    });
  }
//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Testing",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: inputeController,
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
            ),

            SizedBox(height: 15),

            ElevatedButton(
              onPressed: addItem, 
              child: Text("Add")
            ),
            SizedBox(height: 15),

            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(items[index]),
                    ],
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}