import 'package:flutter/material.dart';

class CurdApp extends StatefulWidget {
  const CurdApp({super.key});

  @override
  State<CurdApp> createState() => _CurdAppState();
}

class _CurdAppState extends State<CurdApp> {
  final List<String> items = []; // Temporary storage for items
  final TextEditingController inputController = TextEditingController();

  void addItem() {
    if(inputController.text.isNotEmpty) {
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
                if (editController.text.isNotEmpty) {
                  editItem(index, editController.text);
                  Navigator.of(context).pop(); // to close the Dialog
                }
              }, 
              child: Text("Save")
            )
          ],
        )
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CRUD App",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            //Input Section
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: inputController,
                    decoration: const InputDecoration(
                      hintText: "Enter item", 
                      border: OutlineInputBorder()
                    ), 
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: addItem, 
                  child: Text("Add")
                )
              ],
            ),
            SizedBox(height: 16),
            //List Section
            Expanded(
              child: items.isEmpty ? Center(child: Text("No items added yet")) : ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text(items[index]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => showEditDialog(index), 
                          icon: Icon(Icons.edit, color: Colors.blue)
                        ),
                        IconButton(
                          onPressed: () => deleteItem(index), 
                          icon: Icon(Icons.delete, color: Colors.red)
                        )
                      ],
                    ),
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}