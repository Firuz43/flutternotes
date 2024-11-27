import 'package:flutter/material.dart';

class Practice extends StatefulWidget {
  const Practice({super.key});

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  final List<String> items = [];

  final TextEditingController inputController = TextEditingController();


  //adding string to item list functionality;
  void addItem() {
   if(inputController.text.isNotEmpty) {
    setState(() {
      items.add(inputController.text);
    });
    inputController.clear();
   }
  }

  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
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
              onPressed: () {
                addItem();
              },
               child: Text("ADD")
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(items[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => deleteItem(index), 
                        icon: Icon(Icons.delete, color: Colors.red,)
                      ),
                      Icon(Icons.edit)
                    ],
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}