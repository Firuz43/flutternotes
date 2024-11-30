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
        items.add(inputController.text);
      });
    }
  }

  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  void showEditDialog(int index) {
    TextEditingController editingController = TextEditingController(text: items[index]);
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text(
          "Edit Item"
        ),
        content: TextField(
          controller: editingController,
          decoration: InputDecoration(hintText: "Enter new Vaklue"),
        ),
      )
    );

  }

  void editItem(int index, String newValue) {
    setState(() {
      items[index] = newValue;
    });
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
            ElevatedButton(
              onPressed: addItem, 
              child: Text("Add")
            ),
            Expanded(
              child: items.isEmpty ?  Center(child: Text("No items added yet")) : ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) => Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 2, 5, 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(items[index]),
                            IconButton(
                              onPressed: () => deleteItem(index), 
                              icon: Icon(Icons.delete, color: Colors.red,))
                          ],
                        ),
                      )
                    ],
                  ),
                ))
            )
          ],
        ),
      ),
    );
  }
}