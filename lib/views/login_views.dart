import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  late final TextEditingController _email;   // 1. we create email and password variables late means it
  late final TextEditingController _password; // assigns value later to the variables 


  // 2. Then we will create initState that's given to us by statefulwidgett
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  // 3. Then we will create dispose function that is given to us by statefulwidget ////
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Login view'),
      backgroundColor: Colors.blue,
    ),
    body: Column(
        children: [
          TextField(
            controller: _email, // We are taking them from our textcontroller//
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
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
            
            final email = _email.text;  // 3. Getting emai and password details on button/
            final password = _password.text;
            try {
              final UserCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: email, 
                password: password,  // 4. Authenticating it with firebase creating user
              ); 
              print(UserCredential);
            } on FirebaseAuthException catch(e) {
              if(e.code == 'invalid-credential') {
                print('user not found');
              }else {
                print("Something else happened");
                print(e.code);
              }
            }
            catch(e) {
              print("Something bad happened");
              print(e.runtimeType);
              print(e);
            }
    
          },child: const Text('Login'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/register/', 
                (route) => false,
              );
            },
            child: const Text('Not registered yet? register here'),
          )
        ],
      ),
  );
  }
}
//