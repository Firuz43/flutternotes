import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  late final TextEditingController _email;   // 1. we create email and password variables late means it
  late final TextEditingController _password; // assigns value later to the variables 


  // 2. Then we will create initState that's given to us by statefulwidget
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  // 3. Then we will create dispose function that is given to us by statefulwidget
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registering'), //kind of navigation widget
      backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          TextField(
            controller: _email, // We are taking them from our textcontroller
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration( // This is placeholder
              hintText: "Enter your email",
            ),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: "Enter your password",
            ),
          ),
          TextButton(onPressed: () async {
            final email = _email.text;  // 3. Getting emai and password details on button
            final password = _password.text;
            final UserCredential = FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: email, 
              password: password  // 4. Authenticating it with firebase creating user
            ); 
            print(UserCredential);
          },child: const Text('Register'),
          ),
        ],
      ),
    );
  }
}
