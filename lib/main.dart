import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        
      ),
      home: const HomePage(),
    ),);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late final TextEditingController email;   // 1. we create email and password variables late means it
  late final TextEditingController password; // assigns value later to the variables 


  // 2. Then we will create initState that's given to us by statefulwidget
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registering'), //kind of navigation widget
      backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          TextField(),
          TextField(),
          TextButton(onPressed: () async {
          },child: const Text('Register'),
          ),
        ],
      ),
    );
  }
}
