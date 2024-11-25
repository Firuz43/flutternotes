import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchApp extends StatefulWidget {
  const StopWatchApp({super.key});

  @override
  State<StopWatchApp> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatchApp> {
  late Stopwatch _stopWatch; //it will manage time
  late Timer _timer;  // Periodically updates UI

  String _formattedTime = "00:00:00";

  @override
  void initState() {
    super.initState();
    _stopWatch = Stopwatch();
    _formattedTime = _formatTime(0);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startStopWatch() {
    _stopWatch.start();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _formattedTime = _formatTime(_stopWatch.elapsedMilliseconds);
      });
    });
  }

  void _stopStopWatch() {
    _stopWatch.stop();
    _timer.cancel(); // Pause updates
  }

  void _resetStopWatch() {
    _stopWatch.reset();
    setState(() {
      _formattedTime = _formatTime(0);
    });
    if(_stopWatch.isRunning) {
      _stopStopWatch();
    }
  }

  String _formatTime(int milliseconds) {
    final seconds = (milliseconds ~/ 1000) % 60;
    final minutes = (milliseconds ~/ (1000 * 60)) % 60;
    final hours = milliseconds ~/ (1000 * 60 * 60);

    return "${hours.toString().padLeft(2, '0')}:"
    "${minutes.toString().padLeft(2, '0')}:"
    "${seconds.toString().padLeft(2, '0')}:";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stopwatch",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _formattedTime,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _stopWatch.isRunning ? null : _startStopWatch, 
                  child: const Text("Start"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _stopWatch.isRunning ? _stopStopWatch : null, 
                  child: const Text("Stop")
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _resetStopWatch, 
                  child: const Text("Reset")
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}