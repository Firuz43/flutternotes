import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {

  int _counter = 0;


  void _increment() {
    setState(() {
      _counter++;
    });
  }


  void _decrement() {
    setState(() {
      _counter--;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Count $_counter"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _increment, child: Text("Increment")),
                SizedBox(width: 20),
                ElevatedButton(onPressed: _decrement, child: Text("Decrement"))
              ],
            )
          ],
        ),
      ),
    );
  }
}