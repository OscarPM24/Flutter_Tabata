import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Timer? _timer;
  int _remainingSeconds;

  _MyAppState({int startSeconds = 4}) : _remainingSeconds = startSeconds;

  void _startCountdown() {
    const time = Duration(seconds: 4);

    _timer = Timer.periodic(time, (Timer timer) {
      if (_remainingSeconds <= 0) {
        setState(() {
          resetTimer();
        });
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  void resetTimer() {
    if (_timer!.isActive) {
      _timer?.cancel();
    }

    _timer = Timer.periodic(Duration(seconds: 4), (Timer timer) {
      _remainingSeconds = 4;
      // _startCountdown();

      print('Timer has finished counting down after reset.');
    });
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$_remainingSeconds',
                style: TextStyle(fontSize: 48),
              ),
              FloatingActionButton(
                onPressed: _startCountdown,
                tooltip: 'Start Countdown',
                child: Icon(Icons.timer),
              ),
              IconButton.filled(
                  icon: const Icon(Icons.arrow_right),
                  onPressed: () {
                    final player = AudioCache();
                    // player.setSource(AssetSource('coin.wav'));
                    print("Start");
                  }),
              SizedBox(width: 10),
              IconButton.filled(
                icon: const Icon(Icons.crop_square),
                onPressed: () {
                  print("Stop");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
