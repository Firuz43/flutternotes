import 'package:flutter/material.dart';
import 'package:flutternotes/projects/data.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final TextEditingController inputController = TextEditingController();

  final TextEditingController nameControlle = TextEditingController();
  final TextEditingController surNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  final List<String> names = [];

  final List<Data> datas = [];

  void addText() {
    setState(() {
      if (inputController.text.isNotEmpty) {
        names.add(inputController.text);
        inputController.clear();
      } else {
        debugPrint("Please enter valid text.");
      }
    });

    void addData(String name, String surName, int age) {}
  } //sds叔叔说

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Testing",
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
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter a name",
              ),
            ),
            ElevatedButton(
              onPressed: addText,
              child: const Text("Add"),
            ),
            SizedBox(height: 16),
            TextField(),
            Expanded(
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (context, index) {
                  // Returning a widget for each item//
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(names[index]), //
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
