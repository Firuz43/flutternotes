import 'package:flutter/material.dart';

class CurdApp extends StatefulWidget {
  const CurdApp({super.key});

  @override
  State<CurdApp> createState() => _CurdAppState();
}

class _CurdAppState extends State<CurdApp> {
  @override
  Widget build(BuildContext context) {
    final List<String> items = []; //Temporary storage for items
    final TextEditingController inputController = TextEditingController();

    void addItem() {
      if (inputController.text.isNotEmpty) {
        setState(() {
          items.add(inputController.text);
          inputController.clear();
        });
      }
    }

    void editItem(int index, String newValue) {
      setState(() {
        items[index] = newValue;
      });
    }

    void deleteItem(int index) {
      setState(() {
        items.removeAt(index);
      });
    }

    void showEditDialog(int index) {
      TextEditingController editController =
          TextEditingController(text: items[index]);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Edit Item"),
          content: TextField(
            controller: editController,
            decoration: InputDecoration(hintText: "Enter new value"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (editController.text.isNotEmpty) {
                  editItem(index, editController.text);
                  Navigator.of(context).pop(); //Close dialog
                }
              },
              child: Text("Save"),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CRUD APP",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
