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

    return const Placeholder();
  }
}
