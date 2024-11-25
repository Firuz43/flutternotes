import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchApp extends StatefulWidget {
  const StopWatchApp({super.key});

  @override
  State<StopWatchApp> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatchApp> {
  late Stopwatch _stopWatch; //it will manage time
  late Timer _timer;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}