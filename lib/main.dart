import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutternotes/firebase_options.dart';
import 'package:flutternotes/views/login_views.dart';
import 'package:flutternotes/views/register_view.dart';
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
      appBar: AppBar(
        title: const Text('Main UI'),
        actions: [
          PopupMenuButton<MenuAction>(onSelected: (value)  {

          }, itemBuilder: (context) {
            return [
              const PopupMenuItem<MenuAction>(
                value: MenuAction.logout, 
                child: Text('Log out'),
              ),
            ];

          },)
        ],
        backgroundColor: Colors.blue, 
      ),
      body: const Text('Hello World'), ////////////
    );
  }
}