import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutternotes/firebase_options.dart';
import 'package:flutternotes/views/bmi_calc.dart';
import 'package:flutternotes/views/calculator.dart';
import 'package:flutternotes/views/counter.dart';
import 'package:flutternotes/views/login_views.dart';
import 'package:flutternotes/views/register_view.dart';
import 'package:flutternotes/views/simple_calculator.dart';
import 'package:flutternotes/views/simplecalc.dart';
import 'package:flutternotes/views/todo_list.dart';
import 'package:flutternotes/views/verify_email_view.dart';
import 'dart:developer' as devtools show log;
///
void main() {//////
  WidgetsFlutterBinding.ensureInitialized(); //This is tels flutter to kickstart our app before pressing button
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,//
      ),
      home: const HomePage(),
      routes: {
        '/login/': (context) => const LoginView(),
        '/register/': (cotnext) => const RegisterView(),/// the routes
      },
    ),);//
}
///

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(/////////
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if(user != null) {
                if(user.emailVerified) {
                  return const NotesView();
                }else {
                  return const VerifyEmailView();
                }
              }else {
                return const LoginView();
              }
            default:
            return const CircularProgressIndicator();
          } 
        },
      );
  }
}


class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

enum MenuAction { logout }
//////
class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Counter(),
      // body: Simplecalc(),
      // body: SimpleCalculator(),
      // body: BmiCalc(),
      body: TodoList(),
    );
  }
}

///
// class Counter extends StatefulWidget {
//   const Counter({super.key});

//   @override
//   State<Counter> createState() => _CounterState();
// }

// class _CounterState extends State<Counter> {
//   int _counter = 0;


//   void _increment() {
//     setState(() {
//       _counter++;
//     });
//   }

//   void _decrement() {
//     setState(() {
//       _counter--;
//     });
//   }

//   void _sum() {
//     setState(() {
//       _counter = _counter + 2;
//     });
//   }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text("Counter App"),
  //       backgroundColor: Colors.blue,
  //     ),
  //     body: const Counter(),

      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text("Count: $_counter", style: const TextStyle(fontSize: 24)), const SizedBox(height: 20),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           ElevatedButton(onPressed: _increment, child: const Text("Increment")),
      //           const SizedBox(width: 10),
      //           ElevatedButton(onPressed: _decrement, child: const Text("Decrement")),

      //           ElevatedButton(onPressed: _sum, child: const Text("Sum")),
      //         ],
      //       )
      //     ],
      //   ),
      // ),
//     );
//   }
// } 