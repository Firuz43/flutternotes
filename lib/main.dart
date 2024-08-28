import 'package:flutter/material.dart';
import 'package:flutternotes/views/login_views.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); //This is tels flutter to kickstart our app before pressing button
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
      ),
      home: const LoginView(),
    ),);
}



////

